/*
-> Use a Modal to display CreateGroceryList ( User will enter name of a new list)
-> Plus button will show an alert to create a new grocery list, remove button
-> Remove button
-> item: Name, and the listName which the item belongs to

 Workflow to creating a grocery list:
 User clicks the '+' sign to create new list -> Modal displays prompting user to enter in title of the list and a couple of list items -> User clicks 'Save button' -> When user clicks 'Save' the newly created list gets created and stored in firebase DB which will reflect on the home screen
 
 
 */

import SwiftUI
import FirebaseAuth

struct GroceryListScreen: View {
    @StateObject private var viewModel = GroceryListViewModel()
    @State var isPresentedCreateGroceryList: Bool = false // Modal State to control if the CreateGroceryList screen displays or not
    
    // Store new grocery list name and grocery list items
    @State var newGroceryListName: String = ""
    @State var newGroceryItems: [String] = []
    
    
    // State to navigate the detailed list view of the grocery list
    @State var selectedGroceryList: String
    @State var isPresentedDetailView: Bool = false
    

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack {
                    if viewModel.userGroceryLists.isEmpty {
                        Text("No grocery lists found")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } // else display the list of lists
                        // if the user selects a list we then want to open the detailModal
                        // within the detailModal we display the list of items
                    else {
                        List(viewModel.userGroceryLists, id: \.self) { listName in
                            Text(listName)
                        }
                    }
                } // End of Outer VStack
                .padding()
            } // End of ZStack
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        newGroceryListName = ""
                        newGroceryItems = []
                        // Display create grocery list model
                        isPresentedCreateGroceryList = true
        
                    }) {
                        Image(systemName: "plus")
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action goes here
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .padding()
        } // End of NavigationView
        .onAppear {
            if let userId = Auth.auth().currentUser?.uid {
                viewModel.fetchGroceryLists(for: userId)
            }
        }
        
        // Sheet for CreateGroceryListModal
        .sheet(isPresented: $isPresentedCreateGroceryList){
            CreateGroceryListModal(isPresented: $isPresentedCreateGroceryList, newListName: $newGroceryListName, newItems: $newGroceryItems, saveAction: saveGroceryList)
        }
        
        
        // Sheet for displaying GroceryListDetailView
        
        
        
        
    }
    
    func saveGroceryList(){
        if let userId = Auth.auth().currentUser?.uid{
           viewModel.addGroceryList(name: newGroceryListName, items: newGroceryItems, userId: userId)
            viewModel.fetchGroceryLists(for: userId)
        }
        isPresentedCreateGroceryList = false
    }
    
    
    func openGroceryList(){
        
        
    }
    
   
}


#Preview {
    GroceryListScreen()
}
