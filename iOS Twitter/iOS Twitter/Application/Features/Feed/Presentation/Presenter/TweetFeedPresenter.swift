//
//  TweetFeedPresenter.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import Foundation
import SwiftUI

protocol TweetFeedPresenterView {
    
    func onDisplayTweets(tweets: [TweetViewModel])
}

protocol TweetFeedPresenter {
    
    func onViewDidAppear(view: TweetFeedPresenterView)
}

class DefaultTweetFeedPresenter: TweetFeedPresenter {
    
    var tweetFeedViewModel: [TweetViewModel] = []
    
    
    private let getTweets: GetTweetsInteractor
    private var view: TweetFeedPresenterView? =  nil
    
    init(getTweets: GetTweetsInteractor) {
        self.getTweets = getTweets
    }
    
    func onViewDidAppear(view: TweetFeedPresenterView) {
        self.view = view
        
        let tweets = getTweets.execute()
  
        let tweetFeedViewModel = tweets.map { tweet -> TweetViewModel in
            let user = tweet.user
            let userViewModel = UserViewModel(id: user.id, name: user.name, avatar: Color(hex: user.avatar), username: user.username)

            var image: Color? = nil
            if let img = tweet.image {
                image = Color(hex: img)
            }
            
            return TweetViewModel(id: tweet.id, user: userViewModel, message: tweet.message, date: tweet.date, image: image, url: tweet.url, messageCount: tweet.messageCount, retweetCount: tweet.retweetCount, favouriteCount: tweet.favouriteCount)
        }
        
        view.onDisplayTweets(tweets: tweetFeedViewModel)
    }
}


