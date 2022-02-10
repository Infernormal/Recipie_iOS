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
//    var groceryList : GroceryList
    @ObservedObject var model : GroceryListViewModel
    
    var body: some View {
        ScrollView{
        VStack {
            Text("Your Grocery List:")
            VStack(alignment: .leading,spacing:0) {
                Text("**Ingredients:**")
                ForEach(model.groceryList.list, id: \.self) { listItem in
                            Text("- \(listItem)")
                        }
                        
            }
            .padding(.top)
            Button(action: {
                
//          Delete list
                model.refreshList()
            }, label: {
                Text("Erase the List")
            })
            .buttonStyle(BorderedButtonStyle())
            .navigationTitle("Grocery List")
            .multilineTextAlignment(.center)
    }
}
}
    init(model : GroceryListViewModel) {
          self.model = model
}
}
