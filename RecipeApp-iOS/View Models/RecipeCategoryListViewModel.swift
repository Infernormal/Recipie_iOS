
import Foundation
import Firebase
import FirebaseFirestore


class RecipeCategoryListViewModel: ObservableObject {
    
    @Published var list = [RecipeCategory]()
    
    func deleteData(categoryToDelete: RecipeCategory) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify the document to delete
        db.collection("categories").document(categoryToDelete.id).delete { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Update the UI from the main thread
                DispatchQueue.main.async {
                    
                    // Remove the todo that was just deleted
                    self.list.removeAll { category in
                        
                        // Check for the todo to remove
                        return category.id == categoryToDelete.id
                    }
                }
                
                
            }
        }
        
    }
    
    func addData(name: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to a collection
        db.collection("categories").addDocument(data: ["name":name]) { error in
            
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
        db.collection("categories").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Categories
                        self.list = snapshot.documents.map { d in
                            
                            // Create a Category item for each document returned
                            return RecipeCategory(id: d.documentID,
                                        name: d["name"] as? String ?? "")
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
