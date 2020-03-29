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
    let user: User
    var textLabelText: String?
    var avatar_image: UIImage
    
    init(user: User) {
        self.user = user
        // DONE: Asignar textLabelText, el título del usuario
        self.textLabelText = user.name
        self.avatar_image = UIImage(data: try! Data(contentsOf: URL(string: apiURL + user.avatar_template.replacingOccurrences(of: "{size}", with: "100"))!))! // MUCHO ! ESTOY METIENDO AQUI
    }
}
