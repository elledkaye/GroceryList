/*
 We want to fetch the current user
 
 */

import FirebaseAuth
import FirebaseFirestore
import Foundation
class ProfileViewModel: ObservableObject{
    @Published var user: User? = nil
    
}
