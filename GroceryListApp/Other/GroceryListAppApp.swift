import FirebaseCore
import SwiftUI

@main
struct GroceryListAppApp: App {
    init(){
        FirebaseApp.configure()
        FirebaseConfiguration.shared.setLoggerLevel(.debug)
    }
    
    var body: some Scene {
        WindowGroup {
        ContentView()
        }
    }
}
