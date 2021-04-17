//
//  TwoSideBySideViews .swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 16/04/21.
//

import SwiftUI

struct TwoSideBySideViews: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")
            Text("Secondary")
        }
    }
}

struct TwoSideBySideViews_Previews: PreviewProvider {
    static var previews: some View {
        TwoSideBySideViews()
    }
}
