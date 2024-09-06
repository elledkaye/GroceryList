
import Foundation
import SwiftUI
import FirebaseFirestore

class GroceryListViewModel: ObservableObject{
    @Published var groceryLists: [String] = [] // Array of string to store the names of grocery lists
    @Published var errorMessage : String = ""
 
    
    private let db = Firestore.firestore()
    
    
    // Call a function that will fetch the current users grocery list
    func fetchGroceryLists(for userId: String){
        db.collection("users").document(userId).collection("groceryLists").getDocuments{[weak self] snapshot, error in
            if let error = error{
                self?.errorMessage = "Failed to getch lists: \(error.localizedDescription)"
                return
                
            }
            
            if let documents = snapshot?.documents{
                self?.groceryLists = documents.compactMap{ $0["name"] as? String }
            }
            
        }
        
        
        
    }
    

    
    
    
}
