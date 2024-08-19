import FirebaseCore
import SwiftUI

@main
struct GroceryListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
        ContentView()
        }
    }
}
