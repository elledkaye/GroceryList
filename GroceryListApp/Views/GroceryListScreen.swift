/*
 9/4 Notes:
-> Recommend not to navigate to a new screen to create a grocery list
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
    @State var  isPresentedCreateGroceryList: Bool = false // State to control if the CreateGroceryList screen displays or no??
    
    // Store  neww list name
    @State var newlistName: String = " "
    
    // Store list items which will be an array filled of strings
    @State var newItems: [String] = []
    

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack {
                    if viewModel.groceryLists.isEmpty {
                        Text("No grocery list found")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else {
                        List(viewModel.groceryLists, id: \.self) { listName in
                            Text(listName)
                        }
                    }

                    VStack {
                       
                    } // Button VStack
                } // End of Outer VStack
                .padding()
            } // End of ZStack
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
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
        
        // place modal here
        
    }
}

#Preview {
    GroceryListScreen()
}
