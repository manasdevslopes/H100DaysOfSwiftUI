//
//  ManuallyPublishingObservableObjectChanges.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 10/04/21.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    // Normal way
//    @Published var value = 0
    
    // New way - so that we can add more functionality inside willSet observer or having more control over property. objectWillChange is same as @Published eg - want to log something, want to call another method, want to clamp the integer inside value so it never goes outside of a range - it's all under our control now.
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuallyPublishingObservableObjectChanges: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ManuallyPublishingObservableObjectChanges_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishingObservableObjectChanges()
    }
}
