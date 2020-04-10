//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Fran González on 30/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct UsersResponse: Codable {
    let directoryItems: [DirectoryItem]
      enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
      }
    }


struct DirectoryItem: Codable {
    let user: User
}

class User: Codable {
    let id: Int
    let username: String
    var name: String?
    let avatarTemplate: String
    let canEditName: Bool?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case name = "name"
        case avatarTemplate = "avatar_template"
        case canEditName = "can_edit_name"
    }
}
