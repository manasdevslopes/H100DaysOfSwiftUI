//
//  Gestures.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 13/04/21.
//

import SwiftUI

struct Gestures: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    @State private var currentAmounts: Angle = .degrees(0)
    @State private var finalAmounts: Angle = .degrees(0)
    
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in self.offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }
        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        return VStack {
            Text("Double Tapped")
                .onTapGesture(count: 2) {
                    print("Double Tapped")
                }
            Text("Long Press")
                .onLongPressGesture {
                    print("Long Press")
                }
            
            Text("Long Press with duration")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Long Press with duration")
                }
            
            Text("Long Press with duration with Pressing")
                .onLongPressGesture(minimumDuration: 2, pressing: {inProgress in
                    print("In Progress: \(inProgress)!")
                }) {
                    print("Long Press with duration with pressing")
                }
            Text("Magnification Gesture")
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            self.currentAmount = amount - 1
                        }
                        .onEnded { amount in
                            //                            self.finalAmount += self.currentAmount
                            self.finalAmount = 1
                            self.currentAmount = 0
                        }
                )
            Text("Rotation Effect")
                .rotationEffect(currentAmounts + finalAmounts)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            self.currentAmounts = angle
                        }
                        .onEnded { angle in
                            //                            self.finalAmounts += self.currentAmounts
                            self.finalAmounts = .degrees(0)
                            self.currentAmounts = .degrees(0)
                        }
                )
            Spacer()
            Circle()
                .fill(Color.red)
                .frame(width: 64, height: 64)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(offset)
                .gesture(combined)
        }
        // High Priority Gesture
        //        .highPriorityGesture(
        //            TapGesture()
        //                .onEnded { _ in
        //                    print("VStack tapped")
        //                }
        //        )
        
        //Simultaneous Gesture
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

struct Gestures_Previews: PreviewProvider {
    static var previews: some View {
        Gestures()
    }
}
