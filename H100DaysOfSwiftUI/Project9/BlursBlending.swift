//
//  BlursBlending.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 06/02/21.
//

import SwiftUI

struct BlursBlending: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        //        ZStack {
        //            Image("collins")
        //
        //            Rectangle()
        //                .fill(Color.red)
        //                .blendMode(.multiply)
        //        }
        //        .frame(width: 400, height: 500)
        //        .clipped()
        
        //Or,
        
        //        Image("collins")
        //            .colorMultiply(.red)
        
        VStack {
            ZStack {
                Circle()
//                    .fill(Color.red)
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
//                    .fill(Color.green)
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
//                    .fill(Color.blue)
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
                
                Image("collins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlursBlending_Previews: PreviewProvider {
    static var previews: some View {
        BlursBlending()
    }
}
