//
//  GroceryListViewModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 2/8/22.
//

import Foundation
import Firebase
import FirebaseFirestore


class GroceryListViewModel: ObservableObject {
    @Published var groceryList = GroceryList(id: "", list: [])
    init() {
        getList { groceryList in
            self.groceryList = groceryList
        }
    }
    func refreshList() {
        
        let db = Firestore.firestore()
        
        db.collection("groceryList").document("HdAwNVwHVIJMjgp0qI2W").setData(["list": []]) { error in

            if error == nil {
                
                self.getList { groceryList in
                    self.groceryList = groceryList
                }
            }
        }
    }

    func mergeLists(list: [String]) {
        
        let db = Firestore.firestore()
        
        db.collection("groceryList").document("HdAwNVwHVIJMjgp0qI2W").updateData(["list": FieldValue.arrayUnion(list)])
        { error in
            
            if error == nil {
            }
            self.getList{ groceryList in
                self.groceryList = groceryList
            }
        }
    }
    func getList(completion: @escaping (GroceryList) -> ()) {
        
        let db = Firestore.firestore()
        
        db.collection("groceryList").document("HdAwNVwHVIJMjgp0qI2W").getDocument { (document, error) in
            if let document = document, document.exists {
                let groceryData = document.data()
                let groceryList = groceryData?["list"] as? [String]
                completion(GroceryList(id: groceryData?["id"] as? String ?? "", list: groceryList ?? [""]))
            }
            else {
                print("List does not exist")
            }
        }
    }
}

