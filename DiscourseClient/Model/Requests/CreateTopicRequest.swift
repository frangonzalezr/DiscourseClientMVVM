//
//  CreateTopicRequest.swift
//
//  Created by Ignacio Garcia Sainz on 17/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//  Revisado por Roberto Garrido on 8 de Marzo de 2020
//

import Foundation

// TODO: Implementar las propiedades de esta request
struct CreateTopicRequest: APIRequest {
    
    typealias Response = AddNewTopicResponse
    
    let title: String
    let raw: String
    let createdAt: String
    
    init(title: String,
         raw: String,
         createdAt: String) {
        self.title = title
        self.raw = raw
        self.createdAt = createdAt
    }
    
    var method: Method {
        //fatalError("Need to implement this")
        return .POST
    }
    
    var path: String {
        //fatalError("Need to implement this")
        return "/posts.json"
    }
    
    var parameters: [String : String] {
        //fatalError("Need to implement this")
        return [:]
    }
    
    var body: [String : Any] {
        //fatalError("Need to implement this")
        let body: [String: Any] = [
          "title": title,
          "raw": raw
        ]
        return body
        
    }
    
    var headers: [String : String] {
        fatalError("Need to implement this")
        
    }
}
