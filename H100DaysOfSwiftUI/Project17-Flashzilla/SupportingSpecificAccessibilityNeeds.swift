//
//  SupportingSpecificAccessibilityNeeds .swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 13/04/21.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct SupportingSpecificAccessibilityNeeds: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        VStack {
            HStack {
                if differentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                }
                
                Text("Success")
            }
            .padding()
            .background(differentiateWithoutColor ? Color.black : Color.green)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            
            Spacer()
            
            Text("Hello, World!")
                .scaleEffect(scale)
                .onTapGesture {
                    //                    if self.reduceMotion {
                    //                        self.scale *= 1.5
                    //                    } else {
                    //                        withAnimation {
                    //                            self.scale *= 1.5
                    //                        }
                    //                    }
                    withOptionalAnimation {
                        self.scale *= 1.5
                    }
                }
            
            Spacer()
            
            Text("Hello, World!")
                .padding()
                .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
                .foregroundColor(Color.white)
                .clipShape(Capsule())
        }
    }
}

struct SupportingSpecificAccessibilityNeeds_Previews: PreviewProvider {
    static var previews: some View {
        SupportingSpecificAccessibilityNeeds()
    }
}
