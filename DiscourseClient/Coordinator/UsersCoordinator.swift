//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa el tab del users list
class UsersCoordinator: Coordinator {
    let presenter: UINavigationController

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    override func start() {
        let usersViewModel = UsersViewModel()
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = NSLocalizedString("Users", comment: "")
        presenter.pushViewController(usersViewController, animated: false)
    }
    
    override func finish() {}
}
