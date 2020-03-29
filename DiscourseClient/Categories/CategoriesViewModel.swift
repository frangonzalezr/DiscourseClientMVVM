//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation
// Delegate a través del cual nos vamos a comunicar con el coordinator, contándole todo aquello que atañe a la navegación
protocol CategoriesCoordinatorDelegate: class {

}

// Delegate a través del cual vamos a comunicar a la vista eventos que requiran pintar el UI, pasándole aquellos datos que necesita
protocol CategoriesViewDelegate: class {
    func categoriesFetched()
    func errorFetchingCategories()
}

/// ViewModel representando un listado de categorías
class CategoriesViewModel {
    
    weak var coordinatorDelegate: CategoriesCoordinatorDelegate?
    weak var viewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    var categoryViewModels: [CategoryCellViewModel] = []
    
    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }
    

    func viewWasLoaded() {

        categoriesDataManager.fetchAllCategories { result in
            switch result {
            case .success(let response):
                if let categoriesArray = response?.categoryList.categories {
                    for category in categoriesArray {
                        self.categoryViewModels.append(CategoryCellViewModel(category: category))
                    }
                }
                self.viewDelegate?.categoriesFetched()
                break
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return categoryViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoryViewModels.count else { return nil }
        return categoryViewModels[indexPath.row]
    }
    
}
