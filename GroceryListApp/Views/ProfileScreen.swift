
import SwiftUI
import FirebaseAuth

struct ProfileScreen: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Dislay User info")
                    GLButton(title: "Logout", background: Color.green){
                        // Action of logging in goes here
                        logout()
                    }
                    .padding(.bottom) // Padding for button
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
            
                }
                
                
                
            }// End of ZStack
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                        
                      // Action: Log out
                        
                        
                    }){
                        Image(systemName:"person.crop.circle.fill")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action:{
                        
                        // Action: Show settings
                        
                        
                    }){
                        
                        Image(systemName: "gearshape.fill")
                    }
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
            .padding()
            
        } // End of Navigation view
    }
    
    func logout(){
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            print("User successfully Signed out")
          
            
        }catch let signOutError as NSError{
            print("Error signing out: %@ \(signOutError.localizedDescription)")
            
        }
        
        
    }
}

#Preview {
    ProfileScreen()
}
