//
//  WrappingUIViewControllerInSwiftUIView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 27/03/21.
//

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finish!")
    }
}
struct WrappingUIViewControllerInSwiftUIView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        // TODO : - Save filtered Image back to Photo Album
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
        
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
        
        self.inputImage = nil
        
    }
}

struct WrappingUIViewControllerInSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUIViewControllerInSwiftUIView()
    }
}
