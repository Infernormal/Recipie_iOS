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

    var recipeCategory: RecipeCategory
    
    init(recipeCategory: RecipeCategory) {
        self.recipeCategory = recipeCategory
    }
    
    func deleteData(recipeToDelete: RecipeItem) {
        
        let db = Firestore.firestore()
        
        db.collection("/categories/\(recipeCategory.id)/recipes").document(recipeToDelete.id).delete { error in
            
            if error == nil {

                DispatchQueue.main.async {
                    
                    self.list.removeAll { recipe in
                        
                        return recipe.id == recipeToDelete.id
                    }
                }
                
                
            }
        }
        
    }
    
    func addData(recipeTitle: String,image: String,ingredients:[String],directions: String) {
        
        let db = Firestore.firestore()
        
        db.collection("/categories/\(recipeCategory.id)/recipes").addDocument(data: ["recipeTitle":recipeTitle,"image":image,"ingredients":ingredients,"directions":directions]) { error in
            
            if error == nil {

                self.getData()
            }
            else {
            }
        }
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("/categories/\(recipeCategory.id)/recipes").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            
                            return RecipeItem(id: d.documentID,
                                              recipeTitle: d["recipeTitle"] as? String ?? "",
                                              image: d["image"] as? String ?? "",
                                              ingredients: d["ingredients"] as? [String] ?? [""],
                                              directions: d["directions"] as? String ?? "")
                        }
                    }
                    
                    
                }
            }
            else {
            }
        }
    }
    
}

