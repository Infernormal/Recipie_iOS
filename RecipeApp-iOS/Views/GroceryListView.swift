//
//  GroceryListView.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/8/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn


struct GroceryListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model : GroceryListViewModel

    var body: some View {
        ZStack{
                            Image("dark")
                .edgesIgnoringSafeArea(.all)
        ScrollView{
           
            HStack {
                Text("Dismiss").font(Font.custom("PlusJakartaSans-Bold", size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top,50)
                    .foregroundColor(Color("Brown"))

                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
            }
            Spacer()
        VStack {
            
            VStack(alignment: .leading,spacing:0) {
                Text("Your Grocery List:").font(Font.custom("PlusJakartaSans-Bold", size: 25))
                    .foregroundColor(Color("Brown"))
                
               
                ForEach(model.groceryList.list, id: \.self) { listItem in
                    RowView(item: listItem)
                        }
            }
            
            Button(action: {
                
//          Refresh list
                model.refreshList()
            }){
                Text("erase the list")
                    .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                    .foregroundColor(Color("Brown"))
                    .frame(maxWidth: 200,maxHeight: 75)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color("Brown"), lineWidth: 6))
                    
            
            }
            .background(Color("White"))
            .cornerRadius(60)
                
            .navigationTitle("Grocery List")
            .multilineTextAlignment(.center)
    }
}
        }
}
    init(model : GroceryListViewModel) {
          self.model = model
            model.getList { groceryList in
            model.groceryList = groceryList
}
}
}
