//
//  state.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct state: View {
    @State private var tap = 0
    @State private var name = ""
    
    var body: some View {
        Form {
            Button("Tap Counts: \(tap)") {
                self.tap += 1
            }
            TextField("Enter Your name", text: $name)
            Text("Your name is : \(name)")
            
            ForEach(0 ..< 100){number in
                Text("Row: \(number)")
            }
        }
    }
}

struct state_Previews: PreviewProvider {
    static var previews: some View {
        state()
    }
}
