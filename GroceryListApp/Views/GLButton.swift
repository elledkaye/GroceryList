// Reusable button

import SwiftUI

struct GLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    
    //Neomorphic shadows and highlights
    private let darkShadow = Color.black.opacity(0.2)
    private let lightShadow = Color.white.opacity(0.7)
    
    var body: some View {
        Button{
            action()
        }label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    //.foregroundColor(background)
                    .fill(background)
                    .shadow(color: darkShadow, radius: 10, x: 10, y: 10) // Dark shadow
                    .shadow(color: lightShadow, radius: 10, x: -5, y: -5) // Light shadow
                
                
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                    .bold()
            }
            
        }
        
        //.padding()
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .font(.system(.title2, design: .rounded, weight: .bold))
        
    }
    
   
}


#Preview {
    GLButton(title: "Value", background: Color.green){
        
        //Action
        
        
    }
}
