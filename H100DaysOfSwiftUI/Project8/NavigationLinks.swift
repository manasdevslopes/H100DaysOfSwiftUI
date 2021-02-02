//
//  NavigationLinks.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/02/21.
//

import SwiftUI

struct NavigationLinks: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0..<100) { row in
                    NavigationLink(destination: Text("Detail \(row)")){
                        Text("Row \(row)")
                    }
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NavigationLinks_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinks()
    }
}
