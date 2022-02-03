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
            AsyncImage(url: URL(string: item.image))
            { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 200)
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
