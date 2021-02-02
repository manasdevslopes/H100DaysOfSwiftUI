//
//  ResizeImageUsingGeometryReader.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 01/02/21.
//

import SwiftUI

struct ResizeImageUsingGeometryReader: View {
    var body: some View {
        VStack {
            GeometryReader {geo in
                Image("apollo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
                //                .frame(width: 300, height: 300)
                //                .clipped()
            }
        }
    }
}

struct ResizeImageUsingGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ResizeImageUsingGeometryReader()
    }
}
