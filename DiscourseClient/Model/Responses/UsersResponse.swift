//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Fran González on 30/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct UsersResponse: Codable {
    let directory_items: [Directory_Item]
    let total_rows_directory_items: Int
    let load_more_directory_items: String
}

struct Directory_Item: Codable {
    let id: Int
    let time_read: Int
    let likes_received: Int
    let likes_given: Int
    let topics_entered: Int
    let topic_count: Int
    let post_count: Int
    let posts_read: Int
    let days_visited: Int
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let name: String?
    let avatar_template: String
}
