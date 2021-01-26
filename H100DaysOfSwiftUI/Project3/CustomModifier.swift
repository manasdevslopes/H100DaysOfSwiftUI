//
//  CustomModifier.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 26/01/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}


extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
struct CustomModifier: View {
    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hello SwiftUI")
            
            Text("Hello, World!")
    //            .modifier(Title())
                .titleStyle()
        }
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
