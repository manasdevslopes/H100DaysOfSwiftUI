//
//  PropertyWrappersBecomesStruct.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 27/03/21.
//

import SwiftUI

struct PropertyWrappersBecomesStruct: View {
    @State private var blurAmount:CGFloat = 0 {
        didSet {
            // TODO - this blur amount doesn't change, for that we need custom binding
            // For this we will do in next file - CustomBinding.swift
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

struct PropertyWrappersBecomesStruct_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappersBecomesStruct()
    }
}
