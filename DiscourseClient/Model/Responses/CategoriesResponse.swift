//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable {
    let categoryList: CategoryList
    
    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

struct CategoryList: Codable {
    let can_create_category: Bool
    let can_create_topic: Bool
    let draft: Bool?
    let draft_key: String
    let draft_sequence: Int
    let categories: [Category]
}

struct Category: Codable {
    let name: String
    
}
