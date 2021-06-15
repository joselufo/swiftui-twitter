//
//  iOS_TwitterApp.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 14/6/21.
//

import SwiftUI

@main
struct iOS_TwitterApp: App {
    
    let presenter = DefaultTweetFeedPresenter(getTweets: GetTweetsInteractor())
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TweetFeedView(presenter: presenter)
            }
        }
    }
}
