//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa el tab del users list
class UsersCoordinator: Coordinator, UsersCoordinatorDelegate {
    let presenter: UINavigationController
    let usersDataManager: TopicsDataManager  // UTILIZO EL MISMO DE MOMENTO
    var usersViewModel: UsersViewModel?

    init(presenter: UINavigationController, usersDataManager: TopicsDataManager) {
        self.presenter = presenter
        self.usersDataManager = usersDataManager
    }

    override func start() {
        let usersViewModel = UsersViewModel(usersDataManager: usersDataManager)
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = NSLocalizedString("Users", comment: "")
        usersViewModel.viewDelegate = usersViewController
        usersViewModel.coordinatorDelegate = self
        presenter.pushViewController(usersViewController, animated: false)
    }
    
    override func finish() {}
}
