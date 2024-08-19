import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
                // Header
                HeaderView(title: "Grocery List", subtitle: "Your shopping helper", background: Color.green)
                    .offset(y: 70)
                
                Text("Image can go here")
                    
                Form{
                    // Binding email address to email in the LoginViewModel
                    TextField("Email Address", text: $viewModel.email)
                    
                    // Binding password to password in the LoginViewModel
                    SecureField("Password", text: $viewModel.password)
                    
                    
                    GLButton(title: "Login", background: Color.green){
                        // Action of logging in goes here
                    }
            
                    .padding() // Padding for button
                    
                } // End of Form
                .border(Color.black, width:3) // REMOVE
          
                VStack{
                    Text("Need Help?")
                    NavigationLink("Create an account", destination: RegisterView())
                    NavigationLink("Forgot Password", destination: RegisterView())
                    
                }
                .padding(.bottom, 60)
             
            } // End of VStack
            .border(Color.blue, width:3)// REMOVE
            
        } // End of NavigationView
        .padding(.bottom)
    }
}

#Preview {
    LoginView()
}
