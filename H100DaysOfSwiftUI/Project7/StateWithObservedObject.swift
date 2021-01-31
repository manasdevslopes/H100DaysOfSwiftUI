//
//  StateWithObservedObject.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 31/01/21.
//

import SwiftUI
//it’s time to leave @State behind. Instead we need a more powerful property wrapper called @ObservedObject – let’s look at that here…

//TODO: 1 step : - This class should be conforms to protocol - ObservableObject
class User1: ObservableObject {
//  TODO:  2 step : - write @Published before properties
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct StateWithObservedObject: View {
    //TODO: 3 step: - write @ObservedObject instead of @State
    @ObservedObject private var user = User1()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct StateWithObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        StateWithObservedObject()
    }
}
