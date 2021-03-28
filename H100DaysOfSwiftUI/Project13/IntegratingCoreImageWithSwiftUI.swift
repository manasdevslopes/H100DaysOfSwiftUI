//
//  IntegratingCoreImageWithSwiftUI.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 27/03/21.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct IntegratingCoreImageWithSwiftUI: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "awesome") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
//        let currentFilter = CIFilter.sepiaTone()
//        let currentFilter = CIFilter.pixellate()
//        let currentFilter = CIFilter.crystallize()

        // New Api works fine
//        currentFilter.inputImage = beginImage
        // Old Api
//        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
//        currentFilter.intensity = 1
//        currentFilter.scale = 100
//        currentFilter.radius = 200
        
        
        // Twirl Image
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else {
            return
        }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(200, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImg)
            image = Image(uiImage: uiImage)
        }
    }
    
}

struct IntegratingCoreImageWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingCoreImageWithSwiftUI()
    }
}


//Apart from SwiftUI’s Image view, the three other image types are:
//
//   UIImage, which comes from UIKit. This is an extremely powerful image type capable of working with a variety of image types, including bitmaps (like PNG), vectors (like SVG), and even sequences that form an animation. UIImage is the standard image type for UIKit, and of the three it’s closest to SwiftUI’s Image type.
//   CGImage, which comes from Core Graphics. This is a simpler image type that is really just a two-dimensional array of pixels.
//   CIImage, which comes from Core Image. This stores all the information required to produce an image but doesn’t actually turn that into pixels unless it’s asked to. Apple calls CIImage “an image recipe” rather than an actual image.



//
//There is some interoperability between the various image types:
//
// 1. We can create a UIImage from a CGImage, and create a CGImage from a UIImage.
// 2. We can create a CIImage from a UIImage and from a CGImage, and can create a    CGImage from a CIImage.
// 3. We can create a SwiftUI Image from both a UIImage and a CGImage.
