
import Foundation
import Firebase
import FirebaseFirestore


class RecipeCategoryListViewModel: ObservableObject {
    
    @Published var list = [RecipeCategory]()
    
    func deleteData(categoryToDelete: RecipeCategory) {
        
        let db = Firestore.firestore()
        
        db.collection("categories").document(categoryToDelete.id).delete { error in
            
            if error == nil {

                DispatchQueue.main.async {
                    self.list.removeAll { category in
                        
                        return category.id == categoryToDelete.id
                    }
                }
                
                
            }
        }
        
    }
    
    func addData(name: String) {
        
        let db = Firestore.firestore()
        
        db.collection("categories").addDocument(data: ["name":name]) { error in
            
            if error == nil {

                self.getData()
            }
            else {
            }
        }
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("categories").getDocuments { snapshot, error in
            
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            
                            return RecipeCategory(id: d.documentID,
                                                  name: d["name"] as? String ?? "")
                        }
                    }
                    
                    
                }
            }
            else {
            }
        }
    }
    
}
