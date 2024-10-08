/*
 Notes:
 - @Published property =
 - snapshot = data snapshot or query sanpshot that represents the data retrieved from a specific query or doc
 - it is a snapshot of the data at a particular moment
 - snapshots are used to retrieve data from the database, listen for real time updates to data and access the contents & metadata of docs
 */

import Foundation
import SwiftUI
import FirebaseFirestore

// Define class HomeViewModel that conforms to the ObservableObject
// This class can be observed for changes b SwiftUI views
class HomeViewModel: ObservableObject{
    
    
    @Published var groceryLists: [String] = [] // Array of string to store the names of grocery lists
    @Published var errorMessage : String = ""
   
    private let db = Firestore.firestore()
    
    // Call a function that will fetch the current users grocery list
    func fetchGroceryLists(for userId: String){
        
        // Access the db collection called "users to get groceryLists for that user"
        // Reminder weak self helps with memory leaks
        db.collection("users").document(userId).collection("groceryLists").getDocuments{[weak self] snapshot, error in
            // Error handling
            if let error = error{
                self?.errorMessage = "Failed to fetch lists: \(error.localizedDescription)"
                return
                
            }
            
            // If there are documents unwrap and assign to variable documents
            // Iterate through and extract the name
            if let documents = snapshot?.documents{
                self?.groceryLists = documents.compactMap{ $0["name"] as? String }
            }
            
        }
        
        
        
    }
    
    
    
}
