//
//  TweetFeedView.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import SwiftUI

struct TweetFeedView: View, TweetFeedPresenterView {
    
    private let presenter: TweetFeedPresenter
    
    @State private var tweets = [TweetViewModel]()
        
    init(presenter: TweetFeedPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        List(tweets) { tweet in
            TweetView(tweet: tweet).padding(4)
        }.listStyle(GroupedListStyle())
        .navigationTitle("Tweets")
        .onAppear(perform: {
            presenter.onViewDidAppear(view: self)
        })
    }
    
    func onDisplayTweets(tweets: [TweetViewModel]) {
        self.tweets = tweets
    }
}

struct TweetView: View {
    
    var tweet: TweetViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle()
                    .fill(tweet.user.avatar)
                    .frame(width: 50, height: 50)
                
                TweetContentView(tweet: tweet)
            }
        }
    }
}

struct TweetContentView: View {
    var tweet: TweetViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(tweet.user.name).bold().lineLimit(1)
                Text(tweet.user.username).foregroundColor(.gray).font(.system(size: 14))
                Text("-").foregroundColor(.gray).font(.system(size: 14))
                Text("\(TweetViewModel.dateFormatter.localizedString(for: tweet.date, relativeTo: Date()))").foregroundColor(.gray).font(.system(size: 14))
                Spacer()
                Image(systemName: "arrowshape.turn.up.forward").frame(width: 5, height: 5, alignment: .center)
            }.padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
            
            Text(tweet.message).lineLimit(5)
            
            if let img = tweet.image {
                Rectangle()
                    .fill(img)
                    .frame(width: .infinity, height: 120, alignment: .center)
            }
            ActionBottomView(tweet: tweet)
        }
    }
}

struct ActionBottomView: View {
    
    var tweet: TweetViewModel
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.gray)
                if tweet.messageCount > 0 {
                    Text("\(tweet.messageCount)").font(.system(size: 12)).foregroundColor(.gray)
                }
            }
            Spacer()
            HStack {
                Image(systemName: "arrow.2.squarepath")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.gray)
                
                if tweet.retweetCount > 0 {
                    Text("\(tweet.retweetCount)").font(.system(size: 12)).foregroundColor(.gray)
                }
            }
            Spacer()
            HStack {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.gray)
                
                if tweet.favouriteCount > 0 {
                    Text("\(tweet.favouriteCount)").font(.system(size: 12)).foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TweetFeedView(presenter: DefaultTweetFeedPresenter(getTweets: GetTweetsInteractor()))
    }
}

