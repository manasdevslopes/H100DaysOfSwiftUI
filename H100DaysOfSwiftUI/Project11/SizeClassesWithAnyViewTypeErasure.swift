//
//  SizeClassesWithAnyViewTypeErasure.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 10/02/21.
//

import SwiftUI

struct SizeClassesWithAnyViewTypeErasure: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}

struct SizeClassesWithAnyViewTypeErasure_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassesWithAnyViewTypeErasure()
    }
}
