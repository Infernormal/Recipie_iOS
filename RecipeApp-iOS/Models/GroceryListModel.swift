//
//  GroceryListModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/8/22.
//

import Foundation

struct GroceryList: Identifiable, Codable {
    var id: String
    var list: [String]
}
