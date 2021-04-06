//
//  IdentifyingViewsWithUsefulLabels.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 03/04/21.
//

import SwiftUI

struct IdentifyingViewsWithUsefulLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    // Slider
    @State private var estimate = 25.0
    // Stepper
    @State private var rating = 3

    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .accessibility(label: Text(labels[selectedPicture]))
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
            }
        
        // TODO : - .accessibility(hidden:) modifier, which makes any view completely invisible to the accessibility system (Voice Over)
        //        Image(decorative: "character")
        //            .accessibility(hidden: true)
        
        // TODO : - This modifier applies to a complete group
        //        VStack {
        //            Text("Your score is")
        //            Text("1000")
        //                .font(.title)
        //        }
        //        .accessibilityElement(children: .combine)
        
        // TODO : - .accessibilityElement(children: .ignore) so the child views are invisible to VoiceOver, then provide a custom label to the parent
        //        VStack {
        //            Text("Your score is")
        //            Text("1000")
        //                .font(.title)
        //        }
        //        .accessibilityElement(children: .ignore)
        //        .accessibility(label: Text("Your score is 1000"))
        
        // TODO : - Slider voiceover
        //        Slider(value: $estimate, in: 0...50)
        //              .padding()
        //              .accessibility(value: Text("\(Int(estimate))"))
        
        
        // TODO : - Stepper Voice over
//        Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
//            .accessibility(value: Text("\(rating) out of 5"))
    }
}

struct IdentifyingViewsWithUsefulLabels_Previews: PreviewProvider {
    static var previews: some View {
        IdentifyingViewsWithUsefulLabels()
    }
}
