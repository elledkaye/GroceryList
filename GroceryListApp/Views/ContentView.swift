/*
- In content view we show the login screen ONLY IF the user is not logged in
 
 - Otherwise IF the user is logged in we display the HomeScreen
 
 */
import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.isSignedIn,
           !viewModel.currentUserId.isEmpty{
            HomeScreen()
            
        }else{
            
            LoginScreen()
        }
   
        
    }
}

#Preview {
    ContentView()
}
