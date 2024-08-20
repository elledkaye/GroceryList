/*
 Reminder: ViewModel envapsulates presentation login and state.
 ViewModels contain the business logic and handle data transformations need for the
 the views to display data correctly
 
 Purpose: is to abstract away the complexity of data manipulation
 
 Relationship w/Views: ViewModels communicate w/views through bindings.
 */

import Foundation


// ObservableObject class conforms to the ObservableObject protocol
// Which means it can be observed by SwiftUI views
class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
        
    }// End of login()
    
    
    // Creating a private function called validate()
    // We are expecting it to return a function
    // If email input is empty or password is empty fill in fields
    // If email is formatted incorrectly show error message
    // Should break this function up one to validate email and one to validate password
    private func validate() -> Bool{
        errorMessage = ""
        
        
        // If email and password are NOT empty then return true
        // Else check if password field is entered
        // Else check if email has been entered in
        // NOTE: trimmingCharacters(in: ) is a method of the string class
        if !email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
           return true
            
            
        }else if !email.trimmingCharacters(in: .whitespaces).isEmpty && password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
            
            errorMessage = "Please enter password"
            return false
            
            
        }else if email.trimmingCharacters(in: .whitespaces).isEmpty && !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
            errorMessage = "Please enter email"
            return false
            
        }else{
            
            errorMessage = "Please enter all fields"
            return false
            
            
        }// End of if/else block
        
        
        // Email validation
        guard email.contains("@") && email.contains(".") else{
            
            errorMessage = " Please enter a valid email"
            return false
        }
        
        // Password validation
    
        
       
        
    }
    
    
    


}
