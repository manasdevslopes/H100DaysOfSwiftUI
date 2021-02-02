//
//  ScrollViewWithScrollingData.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 01/02/21.
//

import SwiftUI

struct CustomText: View {
    var text:String
    var body: some View{
        Text(text)
    }
    init(_ text: String) {
        print("Creating a Custom Text")
        self.text = text
    }
}
struct ScrollViewWithScrollingData: View {
    var body: some View {
        //TODO: - ScrollView lets the data loads at once
//                ScrollView(.vertical, showsIndicators: false) {
//                    VStack(spacing: 10) {
//                        ForEach(0..<100) {
//                            CustomText("Item \($0)")
//                                .font(.title)
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                }
        
        
        
        //TODO: - List - lets the data loads what is visible on screen (limited data)
//        List {
//            ForEach(0..<100) {
//                CustomText("Item \($0)")
//                    .font(.title)
//            }
//        }
        
        
        //Another excellent way that will load data as per the List
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewWithScrollingData_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewWithScrollingData()
    }
}
