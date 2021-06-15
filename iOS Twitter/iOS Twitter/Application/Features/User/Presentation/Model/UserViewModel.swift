//
//  UserViewModel.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import Foundation
import SwiftUI

struct UserViewModel: Identifiable {
    let id: UUID
    let name: String
    let avatar: Color
    let username: String
}
