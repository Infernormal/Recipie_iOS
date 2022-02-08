//
//  ModalViewRecipe.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/7/22.
//

import Foundation
import SwiftUI


struct ModalViewRecipe: View {
    @State var recipeTitle = ""
    @State var image = ""
    @State var ingredients = ""
    @State var directions = ""
    
    @Environment(\.presentationMode) private var presentationMode

    @ObservedObject var model : RecipeListViewModel
    
    var body: some View {
        VStack(spacing: 5) {
            
            TextField("Title", text: $recipeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Image", text: $image)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Ingridients", text: $ingredients)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Directions", text: $directions)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            
            Button(action: {
                
                // Call add data
                model.addData(recipeTitle: recipeTitle, image:image, ingredients:ingredients, directions:directions)
                
                // Clear the text fields
                recipeTitle = ""
                image = ""
                ingredients = ""
                directions = ""
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Add New Recipe")
            })
            
        }
        .padding()
}
    init(recipeCategory: RecipeCategory) {
        self.model = RecipeListViewModel (recipeCategory: recipeCategory)
    }
}
