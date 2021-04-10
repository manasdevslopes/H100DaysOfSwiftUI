//
//  AddingSwiftPackageDependencies.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 10/04/21.
//

import SamplePackage
import SwiftUI

struct AddingSwiftPackageDependencies: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    var body: some View {
        Text(results)
    }
}

struct AddingSwiftPackageDependencies_Previews: PreviewProvider {
    static var previews: some View {
        AddingSwiftPackageDependencies()
    }
}
