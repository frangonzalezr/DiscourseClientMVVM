//
//  SingleUserResponse.swift
//  DiscourseClient
//
//  Created by Fran González on 30/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct SingleUserResponse: Codable {
    let user: UserDetails
}

struct UserDetails: Codable {
    let id: Int
    let username: String
    let name: String?
    let avatar_template: String
    let can_edit_name: Bool
}
