//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation
// Delegate a través del cual nos vamos a comunicar con el coordinator, contándole todo aquello que atañe a la navegación
protocol UsersCoordinatorDelegate: class {

}

// Delegate a través del cual vamos a comunicar a la vista eventos que requiran pintar el UI, pasándole aquellos datos que necesita
protocol UsersViewDelegate: class {
    func usersFetched()
    func errorFetchingUsers()
}

/// ViewModel representando un listado de usuarios
class UsersViewModel {
    
    let usersDataManager: TopicsDataManager  // USO EL MISMO PORQUE YA NOS DA LOS DATOS DE LOS USUARIOS
    weak var coordinatorDelegate: UsersCoordinatorDelegate?
    weak var viewDelegate: UsersViewDelegate?
    var userViewModels: [UserCellViewModel] = []
    
    init(usersDataManager: TopicsDataManager) {
        self.usersDataManager = usersDataManager
    }
    
    func viewWasLoaded() {
        
        self.fetchUserList()
    }
    
    func fetchUserList() {
        usersDataManager.fetchAllTopics { result in
            switch result {
            case .success(let response):
                if let usersArray = response?.users {
                    for user in usersArray {
                        self.userViewModels.append(UserCellViewModel(user: user))
                    }
                }
                self.viewDelegate?.usersFetched()
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
        return userViewModels.count
    }
    
    func viewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < userViewModels.count else { return nil }
        return userViewModels[indexPath.row]
    }
}
