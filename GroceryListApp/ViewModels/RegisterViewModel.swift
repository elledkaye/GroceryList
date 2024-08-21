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
        errorMessage = ""
        
        if name.trimmingCharacters(in: .whitespaces).isEmpty &&
            email.trimmingCharacters(in: .whitespaces).isEmpty && password.trimmingCharacters(in:.whitespacesAndNewlines).isEmpty{
            
            errorMessage = "Please fill out all fields."
            
            return
            
        }
        
        
        if !validateName(){
          return
        }
        
       if !validateEmail(){
            return
        }
        
     if !validatePassword(){
            return
            
        }
        
    }
    
    
    // Validate name
    func validateName() -> Bool{
       if name.trimmingCharacters(in: .whitespaces).isEmpty || name.count < 3{
            errorMessage = "Please enter a valid name"
            return false
            
        }
        return true
        
    }

    
    // Validate email
    func validateEmail() -> Bool{
        if email.trimmingCharacters(in: .whitespaces).isEmpty || !email.contains("@") || !email.contains("."){
            errorMessage = "Please enter a valid email"
            return false
        }
        
        return true
        
    }
    
    // Validate password
    func validatePassword() -> Bool{
        if password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.count < 8 {
            errorMessage = "Please enter in a valid password"
            return false
            
        }
        
        
        return true
        
    }
    

  
}
