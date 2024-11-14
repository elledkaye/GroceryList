/*
 -> Use a Modal to display CreateGroceryList ( User will enter name of a new list)
 -> Plus button will show an alert to create a new grocery list, remove button
 -> item: Name, and the listName which the item belongs to
 
 Workflow to creating a grocery list:
 User clicks the '+' sign to create new list -> Modal displays prompting user to enter in title of the list and a couple of list items -> User clicks 'Save button' -> When user clicks 'Save' the newly created list gets created and stored in firebase DB which will reflect on the home screen
 */

import SwiftUI
import FirebaseAuth

struct GroceryListScreen: View {
    @StateObject private var viewModel = GroceryListViewModel()
    
    // Modal State to control if the CreateGroceryList screen displays or not
    @State var isPresentedCreateGroceryList: Bool = false
    
    // Stores the new grocery list names and initializes as an empty GroceryList
    @State var newGroceryListName: GroceryList = GroceryList(groceryListName: "", items: [])
    
    // Tracks items being added to a new grocery list
    @State var newGroceryItems: [ListItem] = []
    
    
    // Tracks which grocery list is selected
    @State var selectedGroceryList: GroceryList? = nil
    
    // State which tracks whether the detail view is displayed or not
    @State var isPresentedDetailView: Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .cornerRadius(10)
                
                
                // If user has not grocery list display "No Grocery Lists found"
                VStack(spacing:20) {
                    if viewModel.userGroceryLists.isEmpty {
                        Text("No grocery lists found")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                    }
                    // else display the list of lists
                    // if the user selects a list we then want to open the detailModal
                    // within the detailModal we display the list of items
                    else {
                        List(viewModel.userGroceryLists) { groceryList in
                            // Each grocery list name is wrapped in a Button that calls openGroceryList
                            Button(action:{
                                openGroceryList(groceryList)
                            }){
                                HStack{
                                    // Display name of each grocery list
                                    Text(groceryList.groceryListName)
                                        
                                        .foregroundColor(.white)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                        .padding()
                                    
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 10)
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                
                            }
                            .listStyle(.automatic)
                            .listRowBackground(Color.gray)
                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                        } // End of List
                        
                    } // End of else
                    
                  
                } // End of Outer VStack
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                .padding()
                
            } // End of ZStack
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                        // Resetting so when user clicks "+" sign all fields are cleared
                        newGroceryListName.groceryListName = ""
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
            CreateGroceryListModal(isPresented: $isPresentedCreateGroceryList, newListName: $newGroceryListName.groceryListName, newItems: $newGroceryItems, saveAction: saveGroceryList)
        }
        
        
        // Sheet for displaying GroceryListDetailView
        .sheet(item: $selectedGroceryList){ groceryList in
            GroceryListDetailModal(isPresented:$isPresentedDetailView, groceryList: groceryList, dismissAction: {selectedGroceryList = nil})
        }
        
        
    }
    
    func saveGroceryList(){
        if let userId = Auth.auth().currentUser?.uid{
            viewModel.addGroceryList(name: newGroceryListName.groceryListName, items: newGroceryItems, userId: userId)
            viewModel.fetchGroceryLists(for: userId)
        }
        isPresentedCreateGroceryList = false
    }
    
    
    func openGroceryList(_ groceryList: GroceryList){
        selectedGroceryList = groceryList
        isPresentedDetailView = true
    }
    
    
}


#Preview {
    GroceryListScreen()
}
