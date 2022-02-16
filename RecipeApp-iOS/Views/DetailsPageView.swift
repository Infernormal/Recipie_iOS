//
//  DetailsPageView.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/1/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

struct DetailsPage: View {
    let item: RecipeItem
    @ObservedObject var model : GroceryListViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        ZStack { Image("beige")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ZStack{
                        AsyncImage(url: URL(string: item.image))
                        { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: 390, maxHeight: 273)
                        .cornerRadius(20)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 45)
                        Rectangle()
                            .foregroundColor(.clear)
                            .overlay(Image("caprese image"))
                            .padding(.top, 45)
                    }
                    Text(item.recipeTitle).font(Font.custom("PlusJakartaSans-Bold", size: 36))
                        .foregroundColor(Color("Red"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,35)
                    
                    VStack(alignment: .leading,spacing:5) {
                        Text("**Ingredients:**").font(Font.custom("PlusJakartaSans-Bold", size: 18))
                            .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 0))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ForEach(item.ingredients, id: \.self) { ingredient in
                            Text("• \(ingredient)")
                                .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 0))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                    
                    Button(action: {
                        model.mergeLists(list: item.ingredients)
                    })
                    {Text("add to the list")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                            .foregroundColor(Color("Red"))
                            .frame(maxWidth: 150,maxHeight: 20)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color("Red"), lineWidth: 6))
                    }
                    .background(Color("White"))
                    .cornerRadius(60)
                    
                    VStack(alignment: .leading,spacing:5) {
                        Text("**Directions:**")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 0))
                        Text("\(item.directions)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 35, bottom: 30, trailing: 35))
                    }
                }
                .navigationBarBackButtonHidden(true)
                
                .navigationBarItems(leading:
                                        Button(action: {
                    self.presentationMode.wrappedValue.dismiss()})
                                    {Image("arrow")
                        .padding()
                        .frame(width: 45,height: 45)
                        .background(Color("Orange"))
                    .cornerRadius(17)})
            }
            .padding(.top, 1)
            
        }
    }
}
