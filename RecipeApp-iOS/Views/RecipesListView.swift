//
//  RecipesListView.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 1/31/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

struct RecipesListView: View {

    @ObservedObject var model: RecipeListViewModel
    @State var recipeTitle = ""
    @State var image = ""
    @State var ingridients = ""
    @State var directions = ""
  
    var body: some View {
//        NavigationView {
        
        VStack {
        
            List (model.list) { item in
                NavigationLink(destination: DetailsPage(item:item)) {
                HStack {
                    Text(item.recipeTitle)
                        .navigationBarTitle("Recipes")
                    
                    Spacer()
                    
                    // Delete button
                    Button(action: {
                        
                        // Delete recipe
                        model.deleteData(recipeToDelete: item)
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    
                }
                    
            }
            
        }
            Divider()
            
            VStack(spacing: 5) {
                
                TextField("Title", text: $recipeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Image", text: $image)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Ingridients", text: $ingridients)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Directions", text: $directions)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                
                Button(action: {
                    
                    // Call add data
                    model.addData(recipeTitle: recipeTitle, image:image, ingridients:ingridients, directions:directions)
                    
                    // Clear the text fields
                    recipeTitle = ""
                    image = ""
                    ingridients = ""
                    directions = ""
                    
                    
                }, label: {
                    Text("Add New Recipe")
                })
                
            }
            .padding()
    
        }
//    }

    }
    
    
    init(recipeCategory: RecipeCategory) {
        self.model = RecipeListViewModel(recipeCategory: recipeCategory)
        self.model.getData()
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipeCategory: RecipeCategory(id: "DummyId", name: "DummyName"))
    }
}
