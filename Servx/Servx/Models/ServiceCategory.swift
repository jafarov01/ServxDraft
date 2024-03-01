//
//  ServiceCategory.swift
//  Servx
//
//  Created by Makhlug Jafarov on 11/11/2023.
//

import SwiftUI

struct ServiceCategory : Codable {
    let name: String
    var subcategories: [ServiceSubcategory]
}
