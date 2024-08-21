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
        
        //.padding()
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .font(.system(.title2, design: .rounded, weight: .bold))
        .background(Capsule().stroke(.green, lineWidth:2))
    }
    
   
}


#Preview {
    GLButton(title: "Value", background: Color.green){
        
        //Action
        
        
    }
}
