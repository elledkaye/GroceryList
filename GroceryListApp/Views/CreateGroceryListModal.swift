

import SwiftUI

struct CreateGroceryListModal: View {
    @StateObject var viewModel = CreateGroceryListViewModel()
    @State var newItem: String = "" // For adding items dynamically
    @Binding var isPresented: Bool // Binding to control when to show/hide modal
    @Binding var newListName: String // Binding to the new list name
    @Binding var newItems: [String] // Binding to the new items for the list
    
    var saveAction:() -> Void // Closure to handle saving the list
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter list name", text: $newListName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List{
                    ForEach(newItems, id: \.self){
                        item in
                        Text(item)
                    }
                    //.ondelete
                }
                
                HStack{
                    TextField("Add Item", text: $newItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if !newItem.isEmpty{
                            newItems.append(newItem)
                            newItem = ""
                        }
                        
                    }) {
                        
                        Image(systemName: "plus.circle.fill")
                    }
                }
                .padding()
                
                Button("Save", action: saveAction)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                Spacer()
            }
            
            .navigationBarItems(leading: Button("Cancel"){
                isPresented = false
            })
            
            .navigationTitle("Create Grocery List")
        }
    }
    
    private func removeItem(at offsets: IndexSet){
        newItems.remove(atOffsets: offsets)
    }
}

#Preview {
    CreateGroceryListModal(isPresented: .constant(true), newListName: .constant(""), newItems: .constant([]), saveAction: {})
}
