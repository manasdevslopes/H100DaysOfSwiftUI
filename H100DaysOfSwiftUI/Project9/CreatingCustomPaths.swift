//
//  CreatingCustomPaths.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 06/02/21.
//

import SwiftUI

struct CreatingCustomPaths: View {
    var body: some View {
        Path {path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
//        .fill(Color.blue)
//        .stroke(Color.blue, lineWidth: 10)
//        .stroke(Color.blue.opacity(0.25), lineWidth: 10)
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct CreatingCustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CreatingCustomPaths()
    }
}
