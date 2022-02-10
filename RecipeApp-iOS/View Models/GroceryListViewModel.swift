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
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify the document to update
        db.collection("groceryList").document("HdAwNVwHVIJMjgp0qI2W").setData(["list": []]) { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Update the UI from the main thread
//                DispatchQueue.main.async {
                    
                self.getList { groceryList in
                    self.groceryList = groceryList
                }
                    }
                }
    }
        
    
    func mergeLists(list: [String]) {

        // Get a reference to the database
        let db = Firestore.firestore()

        // APPEND NEW LIST AND REMOVE DUPES USING SET? using merge fields? will it work for array type?
        db.collection("groceryList").document("HdAwNVwHVIJMjgp0qI2W").setData(["list":list]) { error in

            // Check for errors
            if error == nil {
                // No errors

                // Call get data to retrieve latest data
                self.getList{ groceryList in
                    self.groceryList = groceryList
                }
            }
            else {
                // Handle the error
            }
        }
    }
    
    func getList(completion: @escaping (GroceryList) -> ()) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
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

