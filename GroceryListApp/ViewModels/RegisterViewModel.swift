/*
 User will be brought to this view if they need to create an account
 
 */
import Foundation

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    
    func register(){
        if name.trimmingCharacters(in: .whitespaces).isEmpty &&
            email.trimmingCharacters(in: .whitespaces).isEmpty && password.trimmingCharacters(in:.whitespacesAndNewlines).isEmpty{
            
            errorMessage = "Please fill out all fields."
            
            return
            
        }
        
        
        guard validateName() else{
            return
        }
        
        guard validateEmail() else{
            return
        }
        
        guard validatePassword() else{
            return
            
        }
        
    }
    
    
    // Validate name
    func validateName() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            return false
            
        }
        
        guard name.count >= 3 else{
            errorMessage = "Please enter a valid name"
            return false
            
        }
        
        return true
        
    }

    
    // Validate email
    func validateEmail() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        
        // Add regex
        guard email.contains("@") && email.contains(".")else{
            errorMessage = "Please enter valid email"
            return false
            
        }
        
        return true
        
    }
    
    // Validate password
    func validatePassword() -> Bool{
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
            
        }
        
        // Add regex
        guard password.count >= 8 else{
            errorMessage = "Please enter in a password with 8 or more characters"
            return false
            
            
        }
        
        return true
        
    }
    

  
}
