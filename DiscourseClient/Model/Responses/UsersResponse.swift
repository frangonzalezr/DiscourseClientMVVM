//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Fran González on 29/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let name: String
    let avatar_template: String
}
