//
//  DisablingUserInteractivityWithallowsHitTesting.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 13/04/21.
//

import SwiftUI

struct DisablingUserInteractivityWithallowsHitTesting: View {
    var body: some View {
        VStack {
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            // By putting this contentShape , spacer area of rectangle also clickable
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                //                .allowsHitTesting(false)
                
                
                
            }
        }
    }
}

struct DisablingUserInteractivityWithallowsHitTesting_Previews: PreviewProvider {
    static var previews: some View {
        DisablingUserInteractivityWithallowsHitTesting()
    }
}
