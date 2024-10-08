/*
 Notes:
 - Reminder a struct is used to store variables of different data types
 
 -Identifiable: Is a protocol that allows SwiftUI to uniquely identify items in lists and other views
 
 */
import Foundation


struct GroceryList: Identifiable{
    var id:String = UUID().uuidString
    var name: String
    var items: [String]
    
    
}
