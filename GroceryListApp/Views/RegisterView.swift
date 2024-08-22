import SwiftUI

struct RegisterView: View {
    
    // Linking the view to the viewModel
    @StateObject var viewModel = RegisterViewModel()
    
    
    @State private var showingRegistrationSuccess = false
    @State private var registrationSuccessful = false
    
    var body: some View {
        NavigationStack{
            VStack{
                // Using reusable headerView
                HeaderView(title: "Register", subtitle: "Your account", background: Color.green)
                    .offset(y:70)
                
                Form{
                    
                    // Form error message
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    // Display if register was successful
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    SecureField("Password", text: $viewModel.password)
                    
                    
                    // Use reusable button
                    GLButton(title: "Register", background: Color.green){
                        
                        viewModel.register()
                        
                    }
                    
                    .padding()
                }
                .offset(y: -50)
                
            } // End of Vstack
            
            
        }
    }
}

#Preview {
    RegisterView()
}
