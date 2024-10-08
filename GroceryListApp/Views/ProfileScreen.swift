
import SwiftUI

struct ProfileScreen: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Dislay User info")
            
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
}

#Preview {
    ProfileScreen()
}
