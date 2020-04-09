//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by Fran González on 29/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit

/// ViewModel que representa un usuario en la lista
class UserCellViewModel {
    var user: User
    var textLabelText: String?
    
    init(user: User) {
        self.user = user
        self.textLabelText = user.name
    }
}
