/*
 Notes:
 - Cancel button nno longer works could be due to how the .sheet(item:) modifier behaves when used with an option item like selectedGroceryList
 
 -When using .sheet(item:) the modal is presented based on the non-nil value of the bound item (in this case, selectedGroceryList)
 
 -To dismiss the modal you need to set selectedGroceryList back to nil, since .sheet(item:) relies on whether the bound item is non-nil or nil to control it's visibility
 
 -Currently isPresented is set to false in my cancel button, but because the modal is bound to selectedGroceryList, the modal won't close unless selectedGroceryList is set to nil
 
 */

import SwiftUI

struct GroceryListDetailModal: View {
    
    
    
    // Binding to control when to show/hide modal
    @Binding var isPresented: Bool
    
    
    // The grocery list object that is being displayed
    var groceryList: GroceryList
    
    // Add a closure for dismissing the modal
    var dismissAction:() -> Void
    
    
    var body: some View {
        NavigationView{
            VStack{
                
               Text("Detailed GroceryList View")
                

                //Load grocery list here
                List(groceryList.items, id:\.self){
                    
                    item in
                    Text(item)
                }
               
                Spacer()
                
            }// End of VStack
            .navigationBarItems(trailing: Image(systemName: "plus"))
            .navigationBarItems(leading: Button("Cancel"){
               dismissAction()
                
            })
            
            .navigationTitle("Grocery Lists View")
            
        } // End of navigation view
        
      
      
    }
}

#Preview {
    GroceryListDetailModal(isPresented: .constant(true), groceryList:GroceryList(name: "Sample List", items:["Bananas", "Bread"]), dismissAction:{})
}
