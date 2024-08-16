import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
                // Header
                HeaderView(title: "Grocery List", subtitle: "Your shopping helper", background: Color.green)
                
                Form{
                    // Binding email address to email in the LoginViewModel
                    TextField("Email Address", text: $viewModel.email)
                    
                    // Binding password to password in the LoginViewModel
                    SecureField("Password", text: $viewModel.password)
                    
                } // End of Form
                
                .padding(.bottom)
                
            } // End of VStack
            
        } // End of NavigationView
        .padding(.bottom)
    }
}

#Preview {
    LoginView()
}
