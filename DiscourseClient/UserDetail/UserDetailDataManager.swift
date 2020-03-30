//
//  UserDetailDataManager.swift
//  DiscourseClient
//
//  Created by Fran González on 30/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// DataManager con las operaciones necesarias de este módulo
protocol UserDetailDataManager: class {
    func fetchUser(name: String, completion: @escaping (Result<SingleUserResponse?, Error>) -> ())
}
