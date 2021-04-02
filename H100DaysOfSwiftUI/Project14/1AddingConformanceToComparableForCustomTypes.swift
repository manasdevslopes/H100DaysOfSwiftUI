//
//  1AddingConformanceToComparableForCustomTypes.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/04/21.
//

import SwiftUI

struct User4: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    // operator overloading
    static func < (lhs: User4, rhs: User4) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct _AddingConformanceToComparableForCustomTypes: View {
//    let values = [1, 5, 2, 3, 6, 8, 7, 4].sorted()
    
    let users = [
            User4(firstName: "Arnold", lastName: "Rimmer"),
            User4(firstName: "Kristine", lastName: "Kochanski"),
            User4(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    // Not required now becoz 'Comparable protocol & static func <' is already used
//    .sorted {
//        $0.lastName < $1.lastName
//    }
    
    // Note : - Comparable protocol gives <  or > and Equatable gives =
    
    var body: some View {
        List(users) {user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

struct _AddingConformanceToComparableForCustomTypes_Previews: PreviewProvider {
    static var previews: some View {
        _AddingConformanceToComparableForCustomTypes()
    }
}
