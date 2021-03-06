//
//  ModalView.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/3/22.
//

import Foundation
import SwiftUI



struct ModalView: View {
    @State var name = ""
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject var model = RecipeCategoryListViewModel()
    var body: some View {
        ZStack {
            Image("beige")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0,maxWidth: .infinity)
            VStack(spacing: 5) {
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Button(action: {
                    
                    model.addData(name: name)
                    
                    name = ""
                    self.presentationMode.wrappedValue.dismiss()
                    
                }){
                    Text("add category")
                        .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                        .foregroundColor(Color("Red"))
                        .frame(maxWidth: 150,maxHeight: 20)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 60)
                                .stroke(Color("Red"), lineWidth: 6))
                }
                .background(Color("White"))
                .cornerRadius(60)
                
            }
            .padding()
        }
    }
}
