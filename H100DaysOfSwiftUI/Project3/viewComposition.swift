//
//  viewComposition.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 26/01/21.
//

import SwiftUI

struct CapsuleText : View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
struct viewComposition: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
    }
}

struct viewComposition_Previews: PreviewProvider {
    static var previews: some View {
        viewComposition()
    }
}
