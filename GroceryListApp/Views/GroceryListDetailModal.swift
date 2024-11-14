/*
 Notes:
 - Cancel button no longer works could be due to how the .sheet(item:) modifier behaves when used with an option item like selectedGroceryList
 
 -When using .sheet(item:) the modal is presented based on the non-nil value of the bound item ( which is selectedGroceryList)
 
 -To dismiss the modal I need to set selectedGroceryList back to nil, since .sheet(item:) relies on whether the bound item is non-nil or nil to control it's visibility
 
 -Currently isPresented is set to false in my cancel button, but because the modal is bound to selectedGroceryList, the modal won't close unless selectedGroceryList is set to nil
 
 */

import SwiftUI

import Firebase

struct GroceryListDetailModal: View {
    // Binding to control when to show/hide modal
    @Binding var isPresented: Bool
    
    // Variable for new groceryItem
    @State var newGroceryListItem: String = ""
    
    // The grocery list object that is being displayed
    // var groceryList: GroceryList
    // -> Change groceryList from a regular variable to a binding
    @Binding var groceryList: GroceryList
    
    
    // Add a closure for dismissing the modal
    var dismissAction:() -> Void
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Remove or add items")
                
                
                //Load grocery list here
                List(groceryList.items, id:\.self){
                    
                    item in
                    Text(item.itemName)
                        .swipeActions{
                            Button("Delete"){
                                // Action here
                                // When we delete an item we want to mutate the array of items of items
                                // Call function to delete item
                                // Passing item to function deleteGroceryListItem
                                deleteGroceryListItem(item)
                                
                            }
                            .tint(.red)
                        }
                    
                    
                }
                Spacer()
                
                HStack{
                    TextField("Add new Item", text: $newGroceryListItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    // Button action goes here
                    // Button will trigger an action to add a new item to the specific list that is opened
                    // Firbase db will have to get updated
                    // And the UI should display the changes
                    Image(systemName: "plus.circle.fill")
                    
                }
            }// End of VStack
            
            .padding()
            
            .navigationBarItems(leading: Button("Cancel"){
                dismissAction()
                
            })
            
            // Show the name of the grocery list that is currently opened
            .navigationTitle(groceryList.groceryListName + " List items")
            
        } // End of navigation view
    } // End of view
    
    // Function to add new items to existing list and the list that is currently opened
    func addNewGroceryListItem(){
        
    }
    
    // We need to remove the grocerylist item at the index array
    // we need to remove the item also from firebase
    // show the changes on the UI
    
    // Needs to take in an item parameter
    func deleteGroceryListItem(_ item:ListItem){
        
        let db = Firestore.firestore()
        
        let listRef = db.collection("groceryLists").document(groceryList.id)
        let itemRef = listRef.collection("items").document(item.id)
        
        itemRef.delete{
            error in
            if let error = error{
                print("Error removing item: \(error).localizedDescription")
            }else{
                print("Item successfully removed")
                
                if let index = groceryList.items.firstIndex(where:{
                    $0.id == item.id}){
                    groceryList.items.remove(at: index)
                }
            }
        }
        
    }
}

#Preview {
    GroceryListDetailModal(
        isPresented: .constant(true), groceryList:Binding.constant(GroceryList(groceryListName: "Sample List", items:[ListItem(itemName:"listItem")]))
        , dismissAction:{})
}

