//
//  RecipeListViewModel.swift
//  RecipeApp-iOS
//
//  Created by Karina Gorkava on 1/31/22.
//

import Foundation
import Firebase
import FirebaseFirestore


class RecipeListViewModel: ObservableObject {
    
    @Published var list = [RecipeItem]()
    
    func deleteData(recipeToDelete: RecipeItem) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify the document to delete
        db.collection("/categories/IVEbv9FlaR9aKbjEVznL/recipes").document(recipeToDelete.id).delete { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Update the UI from the main thread
                DispatchQueue.main.async {
                    
                    // Remove the todo that was just deleted
                    self.list.removeAll { recipe in
                        
                        // Check for the todo to remove
                        return recipe.id == recipeToDelete.id
                    }
                }
                
                
            }
        }
        
    }
    
    func addData(recipeTitle: String,image: String,ingridients:String,directions: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to a collection
        db.collection("/categories/IVEbv9FlaR9aKbjEVznL/recipes").addDocument(data: ["recipeTitle":recipeTitle,"image":image,"ingridients":ingridients,"directions":directions]) { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Call get data to retrieve latest data
                self.getData()
            }
            else {
                // Handle the error
            }
        }
    }
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("/categories/IVEbv9FlaR9aKbjEVznL/recipes").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Categories
                        self.list = snapshot.documents.map { d in
                            
                            // Create a Category item for each document returned
                            return RecipeItem(id: d.documentID,
                                              recipeTitle: d["recipeTitle"] as? String ?? "",
                                              image: d["image"] as? String ?? "",
                                              ingridients: d["ingridients"] as? String ?? "",
                                              directions: d["directions"] as? String ?? "")
                        }
                    }
                    
                    
                }
            }
            else {
                // Handle the error
            }
        }
    }
    
}

