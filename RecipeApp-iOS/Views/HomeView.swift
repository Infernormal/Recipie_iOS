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
            NavigationView {
                
                ZStack{
                    Image("beige")
                    .edgesIgnoringSafeArea(.all)
                    
//                    VStack(spacing:10) {
                
//                HStack {
//                    Button(action: viewModel.signOut) {
//                    Image("Edit")
//
//                    .frame(maxWidth: 62,maxHeight: 62)
//                    .background(Color("White"))
//                    .cornerRadius(17)
//                    .padding(.top, 50)
//                    }
//
//                    Button(action:{self.showGroceryListView.toggle()})
//                                        {Image("grocery list")
//                        .frame(maxWidth: 62,maxHeight: 62)
//                    }
//
                
                                           
                    VStack(spacing:10) {
                        Spacer().frame(width: 0, height: 36.0, alignment: .topTrailing)
                            
                
            
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:HStack {
                    Button(action: viewModel.signOut) {
                    Image("Edit")
                    .frame(maxWidth: 62,maxHeight: 62)
                  
                    }},trailing: HStack { Button(action:{self.showGroceryListView.toggle()})
                        {Image("grocery list")
                        .frame(maxWidth: 62,maxHeight: 62)
                    }
                        .fullScreenCover(isPresented: $showGroceryListView,onDismiss: {
                            //Passing view into modal
                            model.getData()}, content: {GroceryListView(model: modelGrocery)})
                        
                    } )
                    
                        Spacer()
                Text("Categories").font(Font.custom("PlusJakartaSans-Bold", size: 30))
                    .frame(width: 200, height: 40)
                    .foregroundColor(Color("Red"))
          
                    
                List (model.list) { item in
                    NavigationLink(destination: RecipesListView(recipeCategory: item)) {
                    HStack {
                        Text(item.name)
                            
                        
                        Spacer()
                        // Delete button
                        Button(action: {
                            
                            // Delete todo
                            model.deleteData(categoryToDelete: item)
                        }, label: {
                            Image("trash")
                        })
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
                        Button(action:{self.showModalView.toggle()},label: {Image("Vector")})
                            .frame(maxWidth: 62,maxHeight: 62)
                            .background(Color("Orange"))
                            .clipShape(Circle())
                        
                .padding(.bottom,75)
            }
            .sheet(isPresented: $showModalView,onDismiss: {
                model.getData()}, content: {ModalView()})
    }
            
    }
            
    }
        
    init() {
         //We want to initialize the GroceryListViewModel on this screen so itll fetch it basically at the beginning of tha launch after you login
        self.modelGrocery = GroceryListViewModel()
        model.getData()
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
        UITableView.appearance().separatorStyle = .none
    }

    }
