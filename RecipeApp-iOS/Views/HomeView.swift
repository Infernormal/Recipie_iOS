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
    
    @State var name = ""
    @State var showModalView = false

    
    var body: some View {
        Button(action: viewModel.signOut) {
                  Text("Sign out")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemIndigo))
                    .cornerRadius(12)
                    .padding()
                }
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
    
    
    init() {
        model.getData()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
