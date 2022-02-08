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
    @State private var ingredientsList = [String]()
    
    @Environment(\.presentationMode) private var presentationMode

    @ObservedObject var model : RecipeListViewModel
    
    var body: some View {
        VStack(spacing: 5) {
            
            TextField("Title", text: $recipeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Image", text: $image)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            List {
                Section {
                    HStack {
                        TextField("Add one ingredient", text: $ingredients)
                            .autocapitalization(.none)
                            .textFieldStyle(PlainTextFieldStyle())
                        Spacer()
                        Button(action: {addNewIngredient()}, label: {
                            Image(systemName: "plus.circle")
                        })
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    
                    Section {
                        ForEach(ingredientsList, id: \.self) {
                            word in HStack {
                                Text(word)
                            }
                        }
                    }
                }
            }
            TextField("Directions", text: $directions)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            
            Button(action: {
                
                // Call add data
                model.addData(recipeTitle: recipeTitle, image:image, ingredients:ingredientsList, directions:directions)
                
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
    
    func addNewIngredient() {
                // lowercase and trim the word, to make sure we don't add duplicate words with case differences
                let answer = ingredients.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

                // exit if the remaining string is empty
                guard answer.count > 0 else { return }

                // extra validation to come
                withAnimation {
                    ingredientsList.insert(answer, at: 0)
                }
                ingredients = ""
            }
}
