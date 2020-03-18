//
//  AddTopicViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate para comunicar aspectos relacionados con navegación
protocol AddTopicCoordinatorDelegate: class {
    func addTopicCancelButtonTapped()
    func topicSuccessfullyAdded()
}

/// Delegate para comunicar a la vista aspectos relacionados con UI
protocol AddTopicViewDelegate: class {
    func errorAddingTopic()
}

class AddTopicViewModel {
    weak var viewDelegate: AddTopicViewDelegate?
    weak var coordinatorDelegate: AddTopicCoordinatorDelegate?
    let dataManager: AddTopicDataManager

    init(dataManager: AddTopicDataManager) {
        self.dataManager = dataManager
    }

    func cancelButtonTapped() {
        coordinatorDelegate?.addTopicCancelButtonTapped()
    }

    func submitButtonTapped(title: String) {
        /** TODO:
         Realizar la llamada addTopic sobre el dataManager.
         Si el resultado es success, avisar al coordinator
         Si la llamada falla, avisar al viewDelegate
         */
        
        
        
        let title = "Parece que va a se un gran día, dejémoslo así 18/03/2020"
        let raw = "Parece que va a se un gran día, dejémoslo así 18/03/2020"
        let createdAt = "2020-03-15"

        dataManager.addTopic(title: title, raw: raw, createdAt: createdAt) { result in
            switch result {
            case .success(let response):
                self.coordinatorDelegate?.topicSuccessfullyAdded()
                print(response)
                break
            case .failure(let error):
                self.viewDelegate?.errorAddingTopic()
                print(error)
            }
        }
        
        
    }
}
