//
//  SingleUserRequest.swift
//  DiscourseClient
//
//  Created by Fran González on 30/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation


struct SingleUserRequest: APIRequest {
    
    typealias Response = SingleUserResponse
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/users/\(user.username).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
