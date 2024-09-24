
import Foundation
import SwiftUI
import FirebaseFirestore

class GroceryListViewModel: ObservableObject{
    @Published var userGroceryLists: [String] = [] // Array of strings to store the names of grocery lists
    @Published var errorMessage : String = ""
 
    
    private let db = Firestore.firestore()
    
    
    // Call a function that will fetch the current users grocery list
    func fetchGroceryLists(for userId: String){
        db.collection("users").document(userId).collection("groceryLists").getDocuments{[weak self] snapshot, error in
            if let error = error{
                self?.errorMessage = "Failed to fetch lists: \(error.localizedDescription)"
                return
                
            }
            
            if let documents = snapshot?.documents{
                self?.userGroceryLists = documents.compactMap{ $0["name"] as? String }
            }
            
        }
        
        
        
    }
    
    
    func addGroceryList(name: String, items: [String], userId: String){
        let db = Firestore.firestore()
        let groceryListRef = db.collection("users").document(userId).collection("groceryLists").document()
        
        groceryListRef.setData([
            "name": name,
            "items": items
        
        ]){
            
            error in
            if let error = error {
                print ("Error adding grocery list: \(error)")
            }else{
                print("Grocer list added successfully")
                self.fetchGroceryLists(for: userId)
            }
        }
        
        
    }
    
    
    func openGroceryList(){
        
        
    }
    

    
    
    
}
