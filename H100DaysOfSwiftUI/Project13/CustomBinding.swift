//
//  CustomBinding.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 27/03/21.
//

import SwiftUI

struct CustomBinding: View {
    @State private var blurAmount:CGFloat = 0
    
    var body: some View {
        let blur = Binding<CGFloat> (
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...10)
        }
    }
}

struct CustomBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomBinding()
    }
}
