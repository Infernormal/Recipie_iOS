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
//    @ObservedObject var modelGrocery : GroceryListViewModel
    
    @State var name = ""
    @State var showModalView = false
    @State var showGroceryListView = false
    // var for grocery list
    @State var groceryList: GroceryList

    
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
        model.getData()}, content: {GroceryListView(groceryList: groceryList)})
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
    init(groceryList:GroceryList) {
        self.groceryList = groceryList
        model.getData()
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
