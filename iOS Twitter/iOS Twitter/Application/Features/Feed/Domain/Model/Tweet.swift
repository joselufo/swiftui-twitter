//
//  Tweet.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import Foundation

struct Tweet {
    let id = UUID()
    
    let user: User
    let message: String
    let date: Date = Date().addingTimeInterval(Double.random(in: -100000...0))
    
    let image: String?
    let url: String?
    
    let messageCount: Int
    let retweetCount: Int
    let favouriteCount: Int
}
