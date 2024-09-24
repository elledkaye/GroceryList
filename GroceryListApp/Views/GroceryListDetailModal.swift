import SwiftUI

struct GroceryListDetailModal: View {
    
    // Binding to control when to show/hide modal
    @Binding var isPresented: Bool
    
    
    var body: some View {
        Text("Grocery List Detail View")
    }
}

#Preview {
    GroceryListDetailModal(isPresented: .constant(true))
}
