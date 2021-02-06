//
//  ImagePaints.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 06/02/21.
//

import SwiftUI

struct ImagePaints: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 300, height: 300)
                
    //            .background(Color.red)
    //            .border(Color.red, width: 30)
                
    //            .background(Image("example"))
    //            .border(Image("example"), width: 30) //This won't work
            
    //            .border(ImagePaint(image: Image("example"), scale: 0.2), width: 30)
            
                .border(ImagePaint(image: Image("example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("example"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
    }
}

struct ImagePaints_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaints()
    }
}
