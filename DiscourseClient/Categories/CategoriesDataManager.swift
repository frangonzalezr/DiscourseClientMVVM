//
//  CategoriesDataManager.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

import Foundation

/// Errores que pueden darse en el categories data manager
enum CategoriesDataManagerError: Error {
    case malformedURL
    case emptyData
}

/// Data Manager con las opraciones necesarias de este módulo
protocol CategoriesDataManager {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}
