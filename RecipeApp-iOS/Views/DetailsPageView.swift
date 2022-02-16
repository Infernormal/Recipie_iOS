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
    
        
    var body: some View {
        ZStack{
                            Image("light")
                .edgesIgnoringSafeArea(.all)
        ScrollView{
        VStack {
            AsyncImage(url: URL(string: item.image))
            { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 340, height: 225)
            .padding(.top,100)
            VStack(alignment: .leading,spacing:0) {
                Text("**Ingredients:**")
                        ForEach(item.ingredients, id: \.self) { ingredient in
                            Text("- \(ingredient)")
                        }
                        
            }
            .padding(.top)
            Button(action: {
                
                // Merge list
                model.mergeLists(list: item.ingredients)
            }, label: {
                Text("Add to the List")
            })
            .buttonStyle(BorderedButtonStyle())
            
            Text("**Directions:** \(item.directions)")
                .multilineTextAlignment(.leading)
                .padding()
//                    .scaledToFit()
                Spacer()
            }
            .navigationTitle(item.recipeTitle)
            .multilineTextAlignment(.center)
    }
}
}
}
