//
//  DetailsPageViewModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/1/22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

struct RowView: View {
    let item: String
    
    @State private var checked = false
    @State private var stroken = false
    
    var body: some View {
        
        Button(action:{checked.toggle();stroken.toggle()}) {
            
            HStack {
                Image(checked ? "Check" : "check-circle")
                    .padding(EdgeInsets(top: 14, leading: 14, bottom: 14, trailing: 0))
                Text(" \(item)").font(Font.custom("PlusJakartaSans-Bold", size: 18))
                    .strikethrough(stroken)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 50))
                    .frame(width: 250,height: 50, alignment: .leading)
                
            }
            .foregroundColor(Color("Red"))
            .background(Color("White"))
            .cornerRadius(90)
            .padding(.top,10)
            
        }
    }
}
