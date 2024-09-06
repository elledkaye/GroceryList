/*
 9/4 Notes:
-> Recommend not to navigate to a new screen to create a grocery list
-> Use a Modal to display CreateGroceryList ( User will enter name of a new list)
-> Plus button will show an alert to create a new grocery list, remove button
-> Remove button
-> item: Name, and the listName which the item belongs to

 */

import SwiftUI
import FirebaseAuth

struct GroceryListScreen: View {
    @StateObject private var viewModel = GroceryListViewModel()

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
                        // Create a new grocery list
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
    }
}

#Preview {
    GroceryListScreen()
}
