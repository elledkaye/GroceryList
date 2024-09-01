import SwiftUI

// Should be named loginScreen

struct LoginScreen: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "Grocery List", subtitle: "Your shopping helper", background: Color.green)
                    .offset(y: 70)
                
                Text("Image can go here")
                    
                Form{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    // Binding email address to email in the LoginViewModel
                    TextField("Email Address", text: $viewModel.email)
                    
                    // Binding password to password in the LoginViewModel
                    SecureField("Password", text: $viewModel.password)
                    
                    
                    GLButton(title: "Login", background: Color.green){
                        // Action of logging in goes here
                        viewModel.login()
                    }
            
                    .padding() // Padding for button
                    
                } // End of Form
                
                .border(Color.black, width:3) // REMOVE
                .offset(y:-50)
          
                VStack{
                    Text("Need Help?")
                    NavigationLink("Create an account", destination: RegisterScreen())
                    NavigationLink("Forgot Password", destination: RegisterScreen())
                    
                }
                .padding(.bottom)
             
            } // End of VStack
            .border(Color.blue, width:3)// REMOVE
            
        } // End of NavigationView
        .padding(.bottom)
    }
}

#Preview {
    LoginScreen()
}
