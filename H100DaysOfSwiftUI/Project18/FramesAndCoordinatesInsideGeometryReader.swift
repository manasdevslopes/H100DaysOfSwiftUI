//
//  FramesAndCoordinatesInsideGeometryReader.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 14/04/21.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}
/*
 Which coordinate space you want to use depends on what question you want to answer:

 Want to know where this view is on the screen? Use the global space.
 Want to know where this view is relative to its parent? Use the local space.
 What to know where this view is relative to some other view? Use a custom space.
 
 */


struct FramesAndCoordinatesInsideGeometryReader: View {
    var body: some View {
        //        VStack {
        //            GeometryReader { geo in
        //                Text("Hello, World!")
        //                    .frame(width: geo.size.width * 0.9, height: 40)
        //                    .background(Color.red)
        //            }
        //            .background(Color.green)
        //
        //            Text("More text")
        //                .background(Color.blue)
        //        }
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
    }
}

struct FramesAndCoordinatesInsideGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        FramesAndCoordinatesInsideGeometryReader()
    }
}
