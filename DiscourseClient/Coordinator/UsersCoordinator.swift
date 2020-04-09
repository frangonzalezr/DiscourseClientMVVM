//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Fran González on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa el tab del users list
class UsersCoordinator: Coordinator, UserDetailCoordinatorDelegate, UsersCoordinatorDelegate {
    
    func userDetailEditButtonTapped(newName: String) {
        // CAMBIAMOS name EN EL OBJETO DEL USUARIO SELECCIONADO
        userSelected?.name = newName
        
        // ARREGLAR ESTA CHAPUZA
        userDetailDataManager.changeUserName(user: userSelected!) { [weak self] (result) in
            switch result {
            case .success(let response):
                print(response ?? "NO HA DEVUELTO NADA, TRANQUILO")
                // PERO TAMBIEN TENEMOS QUE CAMBIARLO EN EL ARRAY DE DONDE VIENE
                if let userChanging = self?.usersViewModel?.userViewModels.first(where: {$0.user.id == self?.userSelected?.id}){
                    // CAMBIO LA ETIQUETA DEL USUARIO EN LA TABLA ANTES DE VOLVER
                    userChanging.textLabelText = newName
                    // Y TAMBIEN EL NOMBRE DEL USUARIO EN EL ARRAY
                    userChanging.user.name = newName
                    // Y AVISO AL VIEW MODEL DE QUE LO HEMOS CAMBIADO EN LA LLAMADA A LA API
                    // Y ASI NI SIQUIERA NECESITO VOLVER A HACER LA LLAMADA
                    
                    // AQUI PONGO UN ALERT AVISANDO DE QUE SE HA CAMBIADO CORRECTAMENTE
                    
                    let title = NSLocalizedString("User Name Successfully Changed" , comment:"")
                    if let responseUnwrapped = response {
                        let message = NSLocalizedString("The response was: \(responseUnwrapped.success)" , comment:"")
                        self?.showAlert(message, title)
                    }

                    self?.usersViewModel?.userNameChanged()
                }
                break
            case .failure(let error):
                
            // AQUI PONGO UN ALERT DE QUE HA HABIDO ALGUN ERROR
                if case let SessionAPIError.apiError(finalAPIError) = error {
                    let action = finalAPIError.action ?? "No action"
                    let errors = finalAPIError.errors?.joined(separator: ", ") ?? "No error description"
                    let title = NSLocalizedString("Error changing User name" , comment:"")
                    let message = NSLocalizedString("\(action) error: \(errors)" , comment:"")
                    self?.showAlert(message, title)
                }
                print("EL ERROR DE CAMBIAR EL NOMBRE DEL USUARIO ES: \(error)")
            }
            //self.presenter.popViewController(animated: true)
        }
    }
    
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = NSLocalizedString("Error", comment: ""),
                               _ alertActionTitle: String = NSLocalizedString("OK", comment: "")) {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: {(alert: UIAlertAction) in self.userDetailBackButtonTapped()}))
        presenter.present(alertController, animated: true, completion: nil)
    }
    
    func userDetailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
    
    let presenter: UINavigationController
    let usersDataManager: UsersDataManager
    let userDetailDataManager: UserDetailDataManager
    var usersViewModel: UsersViewModel?
    var userSelected: User?

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
        userSelected = user
        userDetailViewController.title = NSLocalizedString("\(user.username)", comment: "")
        print("SELECCIONAMOS EL USER \(user.username)")
        userDetailViewController.labelUserID.text = "\(user.id)"
        userDetailViewController.labelUserName.text = "\(user.name ?? "")"
        userDetailViewController.textUserName.text = "\(user.name ?? "")"
            //PRIMERO HACEMOS UNA LLAMADA FETCH SINGLE USER
        userDetailDataManager.fetchUser(user: user) { (result) in
            switch result {
            case .success(let response):
                print(response ?? "NO HAY RESPUESTA")
                if ((response?.user.canEditName) != nil && response?.user.canEditName == true) {
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
