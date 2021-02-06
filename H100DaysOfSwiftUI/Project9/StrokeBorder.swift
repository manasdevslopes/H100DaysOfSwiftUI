//
//  StrokeBorder.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 06/02/21.
//

import SwiftUI

struct Arc1: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

//In Circle by default strokeBorder is present but in arc its not present.
//So to use strokeBorder , need to make arc struct conforms to InsettableShape instead of Shape. and write func inset with resturn some InsettableShape
//InsettableShape build upon Shape so no need to write both

struct StrokeBorder: View {
    var body: some View {
        VStack {
            Circle()
                //            .stroke(Color.blue, lineWidth: 40)
                .strokeBorder(Color.blue, lineWidth: 40)
                .frame(width: 300, height: 300)
            Spacer()
            Arc1(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                //                            .stroke(Color.blue, lineWidth: 40)
                .strokeBorder(Color.blue, lineWidth: 40)
                .frame(width: 300, height: 300)
        }
    }
}

struct StrokeBorder_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorder()
    }
}
