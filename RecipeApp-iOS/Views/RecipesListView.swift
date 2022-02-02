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

    @ObservedObject var model = RecipeListViewModel()
    @State var recipeTitle = ""
  
    var body: some View {
//        NavigationView {
        
        VStack {
        
            List (model.list) { item in
                NavigationLink(destination: EmptyView()) {
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

                
                Button(action: {
                    
                    // Call add data
                    model.addData(recipeTitle: recipeTitle)
                    
                    // Clear the text fields
                    recipeTitle = ""
                    
                    
                }, label: {
                    Text("Add New Recipe")
                })
                
            }
            .padding()
    
        }
//    }

    }
    
    
    init() {
        model.getData()
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
