//
//  CustomizeAnimation.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 30/01/21.
//

import SwiftUI

struct CustomizeAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            //            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
        )
        .onAppear {
            self.animationAmount = 2
        }
//        .scaleEffect(animationAmount)
        //        .blur(radius: (animationAmount - 1) * 3)
        
        //        .animation(.easeOut)
        //        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
        //        .animation(.easeInOut(duration: 2))
        //        .animation(Animation.easeInOut(duration: 2).delay(1))
        //        .animation(Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true))
        //        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
    }
}

struct CustomizeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeAnimation()
    }
}
