
import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State var userId: String?
    
    var body: some View {
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
            
            
        }
        .onAppear {
            if let userId = Auth.auth().currentUser?.uid{
                viewModel.fetchGroceryLists(for: userId)
                
            }
             
        }
        
        
        TabView{
             // User is at the home screen
            // If the current user does not have a list (dictionary) already set up then show no list
            // Otherwise we want to dislay the list of lists
            
            
          Text("Home")
                .tabItem { Label("Home" , systemImage: "house")
                }
            
            Text("Profile")
                .tabItem { Label("Profile" , systemImage: "person.circle") }
        }
    }
}

#Preview {
    HomeView()
}
