// Reusable button

import SwiftUI

struct GLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
            
        }
        
        .padding()
    }
}

#Preview {
    GLButton(title: "Value", background: Color.green){
        
        //Action
        
        
    }
}
