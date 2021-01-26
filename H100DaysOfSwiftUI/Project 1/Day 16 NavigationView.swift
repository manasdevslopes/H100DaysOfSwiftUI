//
//  Day 16 NavigationView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct Day_16_NavigationView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
//            .navigationBarTitle(Text("SwiftUI"))
//            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct Day_16_NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        Day_16_NavigationView()
    }
}
