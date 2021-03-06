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
            Image("yellow")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                
                Spacer().frame(width: 0, height: 36.0, alignment: .topLeading)
                HStack {
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                        Image("arrow")
                            .padding()
                            .frame(width: 45,height: 45)
                            .background(Color("White"))
                            .cornerRadius(17)
                            .padding()
                    }
                    
                    .padding(.leading,40)
                    Spacer()
                    
                }
                
                VStack {
                    
                    VStack(alignment: .leading,spacing:0) {
                        Text("Grocery List:").font(Font.custom("PlusJakartaSans-Bold", size: 36))
                            .foregroundColor(Color("Red"))
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 20, trailing: 0))
                        
                        
                        ForEach(model.groceryList.list, id: \.self) { listItem in
                            RowView(item: listItem)
                        }
                    }
                    
                    Button(action: {
                        model.refreshList()
                    }){ HStack{
                        
                        Text("delete list")
                            .font(Font.custom("PlusJakartaSans-Bold", size: 18))
                            .foregroundColor(Color("White"))
                            .frame(maxWidth: 200,maxHeight: 75)
                            .padding()
                        
                    }
                    .background(Color("Red"))
                    .cornerRadius(60)
                    .padding()
                    .padding(EdgeInsets(top: 20, leading: 50, bottom: 10, trailing: 50))
                    .multilineTextAlignment(.leading)
                    }
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
