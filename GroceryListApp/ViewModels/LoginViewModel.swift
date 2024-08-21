/*
 Reminder: ViewModel envapsulates presentation login and state.
 ViewModels contain the business logic and handle data transformations need for the
 the views to display data correctly
 
 Purpose: is to abstract away the complexity of data manipulation
 
 Relationship w/Views: ViewModels communicate w/views through bindings.
 */

import FirebaseAuth
import Foundation


// ObservableObject class conforms to the ObservableObject protocol
// Which means it can be observed by SwiftUI views
class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
 
    
    func login(){
        if email.trimmingCharacters(in: .whitespaces).isEmpty && password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errorMessage = "please enter both email and password"
            return
        }
        
        guard validateEmail() else{
            return
            
        }
        
        guard validatePassword() else{
            return
        }
        
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password) // Reference to firebase authentication
        
    }
   
// Using guard statements to validate users input in email and password
    
    // Validate email
    func validateEmail() -> Bool{
        errorMessage = ""
        
        // guard will return true if email is not empty after removing any whitespaces return false
        // NOTE trimmpingCharacters(in: ) is a method in swift
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            return false
        }
        
        // guard will return true if email contains both a "@" and a "."
        guard email.contains("@") && email.contains(".")else{
            errorMessage = "Please enter valid email"
            return false
            
        }
        
        return true
        
        
    }// End of validateEmail
    
    
    
    // Function validatePassowrd)
    func validatePassword() -> Bool{
        errorMessage = ""
        
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMessage = "Please enter password"
            return false
            
        }
        
        
        guard password.count >= 8 else {
            errorMessage = "Please enter a valid password"
            return false
        }
        
        return true
        
    }// End of validatePassword()

}
