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
    func errorAddingTopic(error: Error)
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

    func submitButtonTapped(title: String, raw:String) {
        /** DONE:
         Realizar la llamada addTopic sobre el dataManager.
         Si el resultado es success, avisar al coordinator
         Si la llamada falla, avisar al viewDelegate
         */
        dataManager.addTopic(title: title, raw: raw, createdAt: "") { result in
            switch result {
            case .success(let response):
                self.coordinatorDelegate?.topicSuccessfullyAdded()
                print(response as Any)
                break
            case .failure(let error):
                self.viewDelegate?.errorAddingTopic(error: error)
                print(error)
            }
        }
        
        
    }
}
