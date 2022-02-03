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
    
    var body: some View {
        ScrollView{
        VStack {
//            ZStack(alignment: .bottomTrailing){
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                Text(item.ingridients)
                    .multilineTextAlignment(.leading)
                    .edgesIgnoringSafeArea(.top)
//                    .scaledToFit()
                Text(item.directions)
//                    .scaledToFit()
//                    .scaledToFit()
                Spacer()
            }
            .navigationTitle(item.recipeTitle)
    }
}
}
