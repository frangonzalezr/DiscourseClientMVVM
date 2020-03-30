//
//  UsersDataManager.swift
//  DiscourseClient
//
//  Created by Fran González on 29/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Errores que pueden darse en el topics data manager
enum UsersDataManagerError: Error {
    case unknown
}

protocol UsersDataManager {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}
