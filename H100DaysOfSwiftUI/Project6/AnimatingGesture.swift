//
//  AnimatingGesture.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 30/01/21.
//

import SwiftUI

struct AnimatingGesture: View {
    let letters = Array("Hello SwiftUI - iOS Dev")
    @State private var enabled = false
    @State private var dragAmount1 = CGSize.zero
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        //.onEnded { _ in self.dragAmount = .zero }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.dragAmount = .zero
                            }
                        }
                )
            
            //            .animation(.spring())
            
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(2)
                        .font(.title)
                        .background(self.enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount1)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount1 = $0.translation }
                    .onEnded { _ in
                        self.dragAmount1 = .zero
                        self.enabled.toggle()
                    }
            )
        }
    }
    
    
    
    
    
}

struct AnimatingGesture_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGesture()
    }
}
