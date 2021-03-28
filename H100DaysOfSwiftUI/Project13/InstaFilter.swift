//
//  InstaFilter.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 28/03/21.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct InstaFilter: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        let intensity = Binding<Double> (
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        return NavigationView{
            VStack {
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture() {
                    self.showingImagePicker = true
                }
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }.padding(.vertical)
                
                HStack {
                    Button("Change Filter - \(currentFilter.name)") {
                        self.showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let processedImage = self.processedImage else { return }
                        
                        let imageSaver = ImageSaver1()
                        imageSaver.successHandler = {
                            print("Success!")
                        }

                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                        
                        
                    }.disabled((self.image != nil) ? false : true)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges()) },
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
                    .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
                    .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
                    .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
                    .cancel()
                ])
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }                
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
//        currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct InstaFilter_Previews: PreviewProvider {
    static var previews: some View {
        InstaFilter()
    }
}
