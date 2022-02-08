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
    @State var ingredients = ""
    @State var directions = ""
    @State var showModalView = false
    @State var recipeCategory: RecipeCategory
  
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
            
            Button("Add Recipe") {
                self.showModalView.toggle()
            }
        }
        .sheet(isPresented: $showModalView,onDismiss: {
            model.getData()}, content: {ModalViewRecipe(recipeCategory: recipeCategory)})

    }
    
    init(recipeCategory: RecipeCategory) {
                self.model = RecipeListViewModel(recipeCategory: recipeCategory)
                self.recipeCategory = recipeCategory
                self.model.getData()
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipeCategory: RecipeCategory(id: "DummyId", name: "DummyName"))
    }
}
