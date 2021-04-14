//
//  CustomAlignmentGuides.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 14/04/21.
//

import SwiftUI

extension VerticalAlignment {
    // Can use enum or struct
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuides: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@manas_iosdev")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                Image("manas")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("Manas Vijay")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct CustomAlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentGuides()
    }
}
