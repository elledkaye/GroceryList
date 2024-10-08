import SwiftUI

// Should be named loginScreen

struct LoginScreen: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                // Header
                HeaderView(title: "Grocery List", subtitle: "Your shopping helper", background: Color.green)
                    .padding(.top, 60)
                
                    
                VStack (spacing:16){
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                            .padding(.bottom, 8)
                    }
                    
                    // Binding email address to email in the LoginViewModel
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .padding()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                        
                    
                    
                    // Binding password to password in the LoginViewModel
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    
                    GLButton(title: "Login", background: Color.green){
                        // Action of logging in goes here
                        viewModel.login()
                    }
            
                    .padding(.bottom) // Padding for button
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                   
                 
                } // End of VStack
                
                .border(Color.black, width:3) // REMOVE
                .background(Color.clear)
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
