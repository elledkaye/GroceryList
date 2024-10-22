/*
 Notes:
 - Reminder a struct is used to store variables of different data types
 
 -Identifiable: Is a protocol that allows SwiftUI to uniquely identify items in lists and other views
 */

import Foundation

struct GroceryList: Identifiable{
    var id:String = UUID().uuidString
    var groceryListName: String // Holds the name of the grocery list
    var items: [ListItem] // An array of ListItem objects that represent individual items in the list

}


struct ListItem: Codable, Hashable{
    var id: String = UUID().uuidString
    var itemName: String // The name of EACH grocery list item
    
}
