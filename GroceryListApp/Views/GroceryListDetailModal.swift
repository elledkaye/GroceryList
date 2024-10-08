import SwiftUI

struct GroceryListDetailModal: View {
    
    
    
    // Binding to control when to show/hide modal
    @Binding var isPresented: Bool
    
    
    // The selected grocery list to display details
    var groceryList: GroceryList
    
    
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
            
            .navigationBarItems(leading: Button("Cancel"){
                isPresented = false
                
            })
            
            .navigationTitle("Grocery Lists View")
            
        } // End of navigation view
        
      
      
    }
}

#Preview {
    GroceryListDetailModal(isPresented: .constant(true), groceryList:GroceryList(name: "Sample List", items:["Bananas", "Bread"]))
}
