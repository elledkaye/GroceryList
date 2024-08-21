import SwiftUI

struct RegisterView: View {
    
    // Linking the view to the viewModel
    @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                // Using reusable headerView
                HeaderView(title: "Register", subtitle: "Your account", background: Color.green)
                
                
                Form{
                    
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                    
                    
                    // Use reusable button
                    GLButton(title: "Register", background: Color.green){
                        
                        // Register action will go here
                        
                    }
                    
                    
                }
                
                
                
            } // End of Vstack
            
            
        }
    }
}

#Preview {
    RegisterView()
}
