/*
 10/16:
 - Focus on code clean up
 - Fetching the grocery list and displaying
 - Need to be aware that when we go to modify a list we will no longer be modifying the list item but the whole array
 
 */

import Foundation
import SwiftUI
import FirebaseFirestore

class GroceryListViewModel: ObservableObject{
    
    @Published var userGroceryLists: [GroceryList] = [] // Array of strings to store the names of the users current grocery lists
    @Published var errorMessage : String = ""
 
    private let db = Firestore.firestore()
    
    // Call a function that will fetch the current users grocery list
    func fetchGroceryLists(for userId: String){
        
        // Firestore path is going from users -> grocery list
        db.collection("users").document(userId).collection("groceryLists").getDocuments{[weak self] snapshot, error in
            if let error = error{
                self?.errorMessage = "Failed to fetch lists: \(error.localizedDescription)"
                return
            }
            
            if let documents = snapshot?.documents{
                self?.userGroceryLists = documents.compactMap{ document in
                    debugPrint("fetched list")
                    debugPrint(document)
                    
                    // Fetch groceryListName
                    guard let name = document["groceryListName"] as? String,
                          
                          // Ensuring that items is an array with Strings keys and values
                          let itemsData = document["items"] as? [[String: String]] else{
                        
                        print("Warning: No grocery list name found in document \(document.documentID)")
                        return nil
                    }
                    
                    // 
                    let items = itemsData.compactMap { $0["itemName"].map { ListItem(itemName: $0) } }
                    
                    debugPrint(name)
                    debugPrint(items)
                  
                    return GroceryList(id: document.documentID, groceryListName: name, items: items)
                }
            }
            
        }
        
    }
    
    func addGroceryList(name: String, items: [ListItem], userId: String){
        let db = Firestore.firestore()
        let groceryListRef = db.collection("users").document(userId).collection("groceryLists").document()
        
        
        // for loop, for each
        //var groceryListItems :  [ListItem] = []
        
        //Array
        var groceryList: GroceryList = GroceryList(groceryListName: name, items: items)
        
        
       groceryListRef.setData([
//            "name": name,
//          "items": items
        "groceryListName" : groceryList.groceryListName,
        
        /*
         - Firestore cannot directly store custom swift types such as ListItem, firestore expects data that is written to it's documents to be in a format it understands (dictionaries, key value pairs)
        
         - The map function takes each item in the items array and converts it into a dictionary where the key is "itemName" and the VALUE is the itemName property of that ListItem
         
         */
        "items": items.map { ["itemName": $0.itemName] }
        
        ]){
            error in
            if let error = error {
                print ("Error adding grocery list: \(error)")
            }else{
                print("Grocery list added successfully")
                self.fetchGroceryLists(for: userId)
            }
        }
      
        
    }
    
    
}
