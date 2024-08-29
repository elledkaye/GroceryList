
import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
          Text("Home")
                .tabItem { Label("Home" , systemImage: "house")
                    
                    
                }
            
            Text("Profile")
                .tabItem { Label("Profile" , systemImage: "person.circle") }
        }
    }
}

#Preview {
    HomeView()
}
