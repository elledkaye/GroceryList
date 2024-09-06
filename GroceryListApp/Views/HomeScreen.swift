
/*
 - When the user logs in we want the view to display whether or not the current user has any grocery lists
 
 - If the current user does have grocery lists made we want to display the lists that will be stacked vertically
 
 - Grocery lists displayed will display   -> Showing title of list and due date
 
 - When the user registers account the view should display no current grocery lists
 
 - When the user clicks "Create Grocery List Button" the grocery list screen will display
 
 - Once the user finishes what is needed on the grocery list WE WANT THE PROGRAM TO CREATE A COLLECTION CONTAINING THOSE LIST ITEMS (ARRAY INSIDE OF AN ARRAY)
 
 - If the user wants to do delete the list item the system will let the user slide and delete and it will delete from firebase
 */


import SwiftUI
import FirebaseAuth

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    @State var userId: String?
   // @State var isPresentingCreateGroceryListScreen = false
    
    var body: some View {
        
       /*
        NavigationView{
    
            ZStack{
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    if viewModel.groceryLists.isEmpty{
                        Text("No grocery list found")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }else{
                        List(viewModel.groceryLists, id: \.self){
                            listName in
                            Text(listName)
                        }
                        
                    }
                    
                    VStack{
                            GLButton(title: "Create Grocery List", background: Color.green){
                              
                        }
                            .frame(width: 360, height:80)
                
                    } // Button VStack
                
                    
                } // End of Outter VStack
                .padding()
        
            } //end of ZStack
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                        
                        // Show profile view
                        
                        
                    }){
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Lists")
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .padding()
            
        } // End of NavigationView
      
        .onAppear {
            if let userId = Auth.auth().currentUser?.uid{
                viewModel.fetchGroceryLists(for: userId)
                
            }
        }
        */
        
        TabView{
             // User is at the home screen
            // If the current user does not have a list (dictionary) already set up then show no list
            // Otherwise we want to dislay the list of lists
            
            
            GroceryListScreen()
                .tabItem { Label("Home" , systemImage: "house")
                }
        
            ProfileScreen()
                .tabItem { Label("Profile" ,
                                 systemImage: "person.circle")
                }
        } // End of tab view
         
         
    }
}

#Preview {
    HomeScreen()
}
