//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa el tab del users list
class UsersCoordinator: Coordinator, UserDetailCoordinatorDelegate {
    func userDetailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
    
    let presenter: UINavigationController
    let usersDataManager: UsersDataManager
    let userDetailDataManager: UserDetailDataManager
    var usersViewModel: UsersViewModel?

    init(presenter: UINavigationController, usersDataManager: UsersDataManager, userDetailDataManager: UserDetailDataManager) {
        self.presenter = presenter
        self.usersDataManager = usersDataManager
        self.userDetailDataManager = userDetailDataManager
    }

    func didSelect(user: User) {
        
        /** DONE: Lanzar módulo TopicDetail
         Para ello tendrás que crear TopicDetailViewModel, TopicDetailViewController.
         Asignar "self" como coordinatorDelegate del módulo: Queremos escuchar eventos que requieren navegación desde ese módulo.
         Asignar el VC al viewDelegate del VM. De esta forma, el VC se enterará de lo necesario para pintar la UI
         Finalmente, lanzar el TopicDetailViewController sobre el presenter.
         */
        let userDetailViewModel = UserDetailViewModel(userID: user.id, canEditName: true, userDetailDataManager: userDetailDataManager)
        let userDetailViewController = UserDetailViewController(viewModel: userDetailViewModel)
        userDetailViewController.title = NSLocalizedString("\(user.username)", comment: "")
        print("SELECCIONAMOS EL USER \(user.username)")
        userDetailViewController.labelUserID.text = "\(user.id)"
        userDetailViewController.labelUserName.text = "\(user.name ?? "")"
        userDetailViewController.textUserName.text = "\(user.name ?? "")"
            //PRIMERO HACEMOS UNA LLAMADA FETCH SINGLE USER
        userDetailDataManager.fetchUser(username: user.username) { (result) in
            switch result {
            case .success(let response):
                print(response ?? "NO HAY RESPUESTA")
                if ((response?.user.can_edit_name) != nil && response?.user.can_edit_name == true) {
                    userDetailViewController.userNameStackView.isHidden = true
                    userDetailViewController.userNameEditStackView.isHidden = false
                    userDetailViewController.userNameButtonStackView.isHidden = false
                    print("PODEMOS CAMBIAR EL NOMBRE")
                } else {
                    userDetailViewController.userNameStackView.isHidden = false
                    userDetailViewController.userNameEditStackView.isHidden = true
                    userDetailViewController.userNameButtonStackView.isHidden = true
                    print("NO PODEMOS CAMBIAR EL NOMBRE")
                }
                break
            case .failure(let error):
                print(error)
                    }
            }
        userDetailViewModel.viewDelegate = userDetailViewController
        userDetailViewModel.coordinatorDelegate = self
        presenter.pushViewController(userDetailViewController, animated: true)
    }
    
    override func start() {
        let usersViewModel = UsersViewModel(usersDataManager: usersDataManager)
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = NSLocalizedString("Users", comment: "")
        usersViewModel.viewDelegate = usersViewController
        usersViewModel.coordinatorDelegate = self
        self.usersViewModel = usersViewModel
        presenter.pushViewController(usersViewController, animated: false)
    }
    
    override func finish() {}
}

extension UsersCoordinator: UsersCoordinatorDelegate {

}
