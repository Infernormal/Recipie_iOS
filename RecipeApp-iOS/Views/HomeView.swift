//
//  HomeView.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 1/29/22.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

struct HomeView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @ObservedObject var model = RecipeCategoryListViewModel()
    //Added this back in.  We need to model to do the logic for us
    @ObservedObject var modelGrocery = GroceryListViewModel()
    
    @State var name = ""
    @State var showModalView = false
    @State var showGroceryListView = false
    

    
    var body: some View {
//        Button(action: viewModel.signOut) {
//                  Text("Sign out")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color(.systemIndigo))
//                    .cornerRadius(12)
//                    .padding()
//                }
        Button("Show the List") {
            self.showGroceryListView.toggle()
        }
    .sheet(isPresented: $showGroceryListView,onDismiss: {
        //Passing view into modal
        model.getData()}, content: {GroceryListView(model: modelGrocery)})
        NavigationView {
        
        VStack {
        
            List (model.list) { item in
                NavigationLink(destination: RecipesListView(recipeCategory: item)) {
                HStack {
                    Text(item.name)
                        .navigationBarTitle("Categories")
                    
                    Spacer()
                    
                    // Delete button
                    Button(action: {
                        
                        // Delete todo
                        model.deleteData(categoryToDelete: item)
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
        }
            Divider()
            
            Button("Add Category") {
                self.showModalView.toggle()
            }
        }
        .sheet(isPresented: $showModalView,onDismiss: {
            model.getData()}, content: {ModalView()})
    }
    }
    // Init for grocery list
    init() {
         //We want to initialize the GroceryListViewModel on this screen so itll fetch it basically at the beginning of tha launch after you login
        self.modelGrocery = GroceryListViewModel()
        model.getData()
    }
}

