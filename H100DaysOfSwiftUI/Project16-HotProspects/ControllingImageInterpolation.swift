//
//  ControllingImageInterpolation.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 10/04/21.
//

import SwiftUI

struct ControllingImageInterpolation: View {
    var body: some View {
        Image("alien")
            // .none - gives control to interpolation.
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight:.infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ControllingImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ControllingImageInterpolation()
    }
}
