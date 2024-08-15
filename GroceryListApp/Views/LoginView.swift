//
//  LoginView.swift
//  GroceryListApp
//
//  Created by Danielle Kaye on 8/15/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                Text("This is the login view")
                // Header goes here
                
                Form{
                    TextField("Email Address", text: $viewModel.email)
                    
                    SecureField("Password", text: $viewModel.password)
                    
                }
                
            }
            
        } // End of NavigationView
    }
}

#Preview {
    LoginView()
}
