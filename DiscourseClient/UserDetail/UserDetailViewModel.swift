//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Fran González on 30/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation


/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol UserDetailCoordinatorDelegate: class {
    func userDetailBackButtonTapped()
}
/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol UserDetailViewDelegate: class {
    func userDetailFetched()
}

class UserDetailViewModel {
    var labelUserNameText:String?
    var labelNameText: String?

    
    
    weak var viewDelegate: UserDetailViewDelegate?
    weak var coordinatorDelegate: UserDetailCoordinatorDelegate?
    let userDetailDataManager: UserDetailDataManager
    let userID: Int
    
    init(userID: Int, userDetailDataManager: UserDetailDataManager) {
        self.userID = userID
        self.userDetailDataManager = userDetailDataManager
    }
    
    func viewDidLoad() {
        
    }
    
    func backButtonTapped() {
        coordinatorDelegate?.userDetailBackButtonTapped()
    }

}
