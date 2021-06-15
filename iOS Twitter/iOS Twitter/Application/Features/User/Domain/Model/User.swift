//
//  User.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    let name: String
    let avatar: String
    let username: String
}
