//
//  DeleteTopicResponse.swift
//  DiscourseClient
//
//  Created by Fran González on 26/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation


struct DeleteTopicResponse: Codable {
    let action: String?
    let errors: [String]?
    let error_type: String?
}

