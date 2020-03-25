//
//  TopicsCoordinator.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator que representa la pila de navegación del topics list.
/// Tiene como hijo el AddTopicCoordinator
class TopicsCoordinator: Coordinator {
    let presenter: UINavigationController
    let topicsDataManager: TopicsDataManager
    let topicDetailDataManager: TopicDetailDataManager
    let addTopicDataManager: AddTopicDataManager
    var topicsViewModel: TopicsViewModel?

    init(presenter: UINavigationController, topicsDataManager: TopicsDataManager,
         topicDetailDataManager: TopicDetailDataManager,
         addTopicDataManager: AddTopicDataManager) {

        self.presenter = presenter
        self.topicsDataManager = topicsDataManager
        self.topicDetailDataManager = topicDetailDataManager
        self.addTopicDataManager = addTopicDataManager
    }

    override func start() {
        let topicsViewModel = TopicsViewModel(topicsDataManager: topicsDataManager)
        let topicsViewController = TopicsViewController(viewModel: topicsViewModel)
        topicsViewController.title = NSLocalizedString("Topics", comment: "")
        topicsViewModel.viewDelegate = topicsViewController
        topicsViewModel.coordinatorDelegate = self
        self.topicsViewModel = topicsViewModel
        presenter.pushViewController(topicsViewController, animated: false)
    }

    override func finish() {}
}

extension TopicsCoordinator: TopicsCoordinatorDelegate {
    func didSelect(topic: Topic) {
        /** DONE: Lanzar módulo TopicDetail
         Para ello tendrás que crear TopicDetailViewModel, TopicDetailViewController.
         Asignar "self" como coordinatorDelegate del módulo: Queremos escuchar eventos que requieren navegación desde ese módulo.
         Asignar el VC al viewDelegate del VM. De esta forma, el VC se enterará de lo necesario para pintar la UI
         Finalmente, lanzar el TopicDetailViewController sobre el presenter.
         HABRIA QUE HACER ANTES UNA LLAMADA SINGLE TOPIC PARA SABER SI SE PUEDE BORRAR
         FALTA LO DEL BOTON DELETE CONDICIONAL
         */
        let topicDetailViewModel = TopicDetailViewModel(topicID: topic.id, topicDetailDataManager: topicDetailDataManager)
        let topicDetailViewController = TopicDetailViewController(viewModel: topicDetailViewModel)
        topicDetailViewController.title = NSLocalizedString("\(topic.title)", comment: "")
        topicDetailViewController.labelTopicID.text = "\(topic.id)"
        topicDetailViewController.labelTopicTitle.text = topic.title
        topicDetailViewController.labelTopicCount.text = "\(topic.posts_count)"
        
        // PRIMERO HACEMOS UNA LLAMADA FETCH TOPIC
        topicDetailDataManager.fetchTopic(id: topic.id) { (result) in
                        switch result {
            case .success(let response):
                if (response.details.can_delete ?? false) {
                    topicDetailViewController.rightBarButtonItem.isEnabled = true
                    topicDetailViewController.rightBarButtonItem.tintColor = .black
                    print("PODEMOS BORRAR")
                } else {
                    topicDetailViewController.rightBarButtonItem.isEnabled = false
                    topicDetailViewController.rightBarButtonItem.tintColor = .clear
                    print("NO PODEMOS BORRAR")
                }
                break
            case .failure(let error):
                print(error)
            }

        }

        
        
        topicDetailViewModel.viewDelegate = topicDetailViewController
        topicDetailViewModel.coordinatorDelegate = self
        presenter.pushViewController(topicDetailViewController, animated: true)
    }

    func topicsPlusButtonTapped() {
        let addTopicCoordinator = AddTopicCoordinator(presenter: presenter, addTopicDataManager: addTopicDataManager)
        addChildCoordinator(addTopicCoordinator)
        addTopicCoordinator.start()

        addTopicCoordinator.onCancelTapped = { [weak self] in
            guard let self = self else { return }

            addTopicCoordinator.finish()
            self.removeChildCoordinator(addTopicCoordinator)
        }

        addTopicCoordinator.onTopicCreated = { [weak self] in
            guard let self = self else { return }

            addTopicCoordinator.finish()
            self.removeChildCoordinator(addTopicCoordinator)
            self.topicsViewModel?.newTopicWasCreated()
        }
    }
}

extension TopicsCoordinator: TopicDetailCoordinatorDelegate {
    func topicDetailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
    
    func topicDetailDeleteButtonTapped() {
        print("BORRAMOS EL TOPIC POR EL ID")
        // ANTES HAY QUE REPINTAR LA TABLA
        presenter.popViewController(animated: true)
    }
}
