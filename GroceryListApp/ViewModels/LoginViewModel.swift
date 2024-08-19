/*
 Reminder: ViewModel envapsulates presentation login and state.
 ViewModels contain the business logic and handle data transformations need for the
 the views to display data correctly
 
 Purpose: is to abstract away the complexity of data manipulation
 
 Relationship w/Views: ViewModels communicate w/views through bindings.
 */

import Foundation

class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    


}
