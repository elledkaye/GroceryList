/*
 Reusable header view that can be used and modiied across other views
 */

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    
    var body: some View {
        VStack{
            
            // ZStack goes over
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(background)
                    .frame(height:150)
                    .offset(y:0)
                    
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundStyle(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundStyle(Color.white)
                    
                    
                } // End of innter VStack
                
                .padding()
                
            } // End of ZStack
            
            .frame(width: UIScreen.main.bounds.width * 3,
                   height:350)
            .offset(y: -150)

            /*
             NOTE:
             The width should be wider than the entirety of the screen, because once we rotate it we don't want it to be cut off
             */
           
        }// End of Outer VStack
    }
}





#Preview {
    HeaderView(title: "Title",
                subtitle: "Subtitle",
               background: Color.blue)
}
