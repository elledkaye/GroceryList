import SwiftUI

struct RegisterView: View {
    
    // Linking the view to the viewModel
    @StateObject var viewModel = RegisterViewModel()
    
    
    @State private var showingRegistrationSuccess = false
    @State private var registrationSuccessful = false
   // @State private var shouldNavigateToHomeScreen = false
    
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
                    GLButton(title: "Create Account", background: Color.green){
                        
                        viewModel.register()
                        
                    }
                    
                    
                    
                    .padding()
                    
                    .alert(isPresented: $registrationSuccessful) {
                        Alert(title: Text("Registration succcess"), message: Text("create"), dismissButton: .default(Text("Ok")))
                        
                    }
                    
                   /* .alert(isPresented: $viewModel.registrationSuccessful) {
                        Alert(title: Text("Success"),
                              message: Text("Registration successful!"),
                              dismissButton: .default(Text("OK"),
                              action:{
                            shouldNavigateToHomeScreen = true
                            
                        }))
                        
                    }*/
                    
                              
                    
                    
                } // End of register form
                
                .offset(y: -50)
                /* .navigationDestination(isPresented: $shouldNavigateToHomeScreen){
                  HomeView()
               }*/
                
            } // End of Vstack
            
            
        }
    }
}

#Preview {
    RegisterView()
}
