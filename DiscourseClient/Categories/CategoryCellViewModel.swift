//
//  CategoryCellViewModel.swift
//  DiscourseClient
//
//  Created by Fran González on 29/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// ViewModel que representa una categoria en la lista
class CategoryCellViewModel {
    let category: Category
    var textLabelText: String?
    
    init(category: Category) {
        self.category = category
        // DONE: Asignar textLabelText, el título del topic
        self.textLabelText = category.name
    }
}
