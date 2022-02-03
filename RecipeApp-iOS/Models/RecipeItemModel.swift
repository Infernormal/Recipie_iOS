//
//  RecipeItemModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 1/31/22.
//

import Foundation



struct RecipeItem: Identifiable {
//    let imageUrl: String
    var id: String
    var recipeTitle: String
    var image: String
    var ingridients: String
    var directions: String
}
