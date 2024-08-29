//
//  ContentViewModel.swift
//  GroceryListApp
// Reminder: ViewModel encapsulates presentation login and state

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject{
    
    @Published var currentUserId: String = ""
    var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        // Listener for our Auth state this should update our main view
        self.handler = Auth.auth().addStateDidChangeListener{
            [weak self]_, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
                
                
            }
            
            
            
        }
        
        
    } // End of init()
    

    // Observing from firebase for current user changes
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
    
}
