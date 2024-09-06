
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
