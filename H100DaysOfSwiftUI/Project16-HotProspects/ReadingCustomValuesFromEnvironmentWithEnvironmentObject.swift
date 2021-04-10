//
//  ReadingCustomValuesFromEnvironmentWithEnvironmentObject.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 06/04/21.
//

import SwiftUI

// Class with published property and observable object
class User5: ObservableObject {
    @Published var name = "Shirley Setia"
}

// First View
struct EditView1: View {
    @EnvironmentObject var user: User5
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

// Second View
struct DisplayView: View {
    @EnvironmentObject var user: User5

    var body: some View {
        Text(user.name)
    }
}

struct ReadingCustomValuesFromEnvironmentWithEnvironmentObject: View {
    let user = User5()
    
    // Combining both views into one
    var body: some View {
        VStack {
            EditView1()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct ReadingCustomValuesFromEnvironmentWithEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCustomValuesFromEnvironmentWithEnvironmentObject()
    }
}
