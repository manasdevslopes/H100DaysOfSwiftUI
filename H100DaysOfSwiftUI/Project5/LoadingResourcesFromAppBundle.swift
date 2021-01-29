//
//  LoadingResourcesFromAppBundle.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 29/01/21.
//

import SwiftUI

struct LoadingResourcesFromAppBundle: View {
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt"){
            // we found the file in our bundle!
            if let fileContents = try? String(contentsOf: fileURL){
                // we loaded the file into a string!
            }
        }
        return Text("Hello, World!")
    }
}

struct LoadingResourcesFromAppBundle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingResourcesFromAppBundle()
    }
}
