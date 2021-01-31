//
//  ClassVsStruct.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 31/01/21.
//

import SwiftUI

//Struct - This properties also changes when textinput data changes
//struct User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

//Class - This properties don't change when textinput data changes
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ClassVsStruct: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ClassVsStruct_Previews: PreviewProvider {
    static var previews: some View {
        ClassVsStruct()
    }
}

//To fix this, it’s time to leave @State behind. Instead we need a more powerful property wrapper called @ObservedObject – let’s look at that in next file…
