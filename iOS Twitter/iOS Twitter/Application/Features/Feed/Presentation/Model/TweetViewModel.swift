//
//  TweetViewModel.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import Foundation
import SwiftUI

struct TweetViewModel: Identifiable {
    let id: UUID
    
    let user: UserViewModel
    let message: String
    let date: Date
    
    let image: Color?
    let url: String?
    
    let messageCount: Int
    let retweetCount: Int
    let favouriteCount: Int
    
    
    static var dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
}
