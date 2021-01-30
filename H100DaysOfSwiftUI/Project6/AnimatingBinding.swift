//
//  AnimatingBinding.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 30/01/21.
//

import SwiftUI

struct AnimatingBinding: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Form {
                Stepper("Scale amount: \(animationAmount,specifier: "%g")", value: $animationAmount.animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...10)
            }
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBinding()
    }
}
