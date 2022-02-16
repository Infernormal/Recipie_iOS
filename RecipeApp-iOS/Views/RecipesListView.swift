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
    
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var modelList: RecipeListViewModel
    @ObservedObject var modelGrocery=GroceryListViewModel()
    @ObservedObject var model = RecipeCategoryListViewModel()
    @State var recipeTitle = ""
    @State var image = ""
    @State var ingredients = ""
    @State var directions = ""
    @State var showModalView = false
    @State var recipeCategory: RecipeCategory
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var showGroceryListView = false
    
    var body: some View {
        
        ZStack{
            Image("yellow")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:10) {
                
                Spacer().frame(width: 0, height: 36.0, alignment: .topTrailing)
                    .fullScreenCover(isPresented: $showGroceryListView,onDismiss: {
                        modelList.getData()}, content: {GroceryListView(model: modelGrocery)})
                
                Spacer()
                Text("Recipes").font(Font.custom("PlusJakartaSans-Bold", size: 30))
                    .frame(width: 200, height: 40)
                    .foregroundColor(Color("Red"))
                
                List (modelList.list) { item in
                    NavigationLink(destination: DetailsPage(item:item, model: modelGrocery)) {
                        HStack {
                            Text(item.recipeTitle)
                            Spacer()
                            
                            Button(action: {
                                modelList.deleteData(recipeToDelete: item)
                            }, label: {
                                Image("trash")
                            })
                                .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                
                Button(action:{self.showModalView.toggle()},label: {Image("Vector")})
                    .frame(maxWidth: 62,maxHeight: 62)
                    .background(Color("Red"))
                    .clipShape(Circle())
                    .padding(.bottom,130)
            }
            Spacer().frame(width: 0, height: 36.0, alignment: .topTrailing)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    self.presentationMode.wrappedValue.dismiss()})
                                    {Image("arrow")
                        .padding()
                        .frame(width: 45,height: 45)
                        .background(Color("White"))
                    .cornerRadius(17)},
                                    trailing:  Button(action:{self.showGroceryListView.toggle()})
                                    {Image("grocery list")
                    .frame(maxWidth: 62,maxHeight: 62)}
                )
            
                .sheet(isPresented: $showModalView,onDismiss: {
                    modelList.getData()}, content: {ModalViewRecipe(recipeCategory: recipeCategory)})
        }
    }
    
    init(recipeCategory: RecipeCategory) {
        self.modelList = RecipeListViewModel(recipeCategory: recipeCategory)
        self._recipeCategory = State(initialValue: recipeCategory)
        self.modelList.getData()
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipeCategory: RecipeCategory(id: "DummyId", name: "DummyName"))
    }
}

