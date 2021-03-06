//
//  Hashable.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//

import SwiftUI

struct Students: Hashable {
    let name: String
}

struct Hashables: View {
    let students = [Students(name: "Harry Potter"), Students(name: "Hermione Granger")]

    var body: some View {
        List(students, id: \.self) { student in
                    Text(student.name)
        }
    }
}

struct Hashables_Previews: PreviewProvider {
    static var previews: some View {
        Hashables()
    }
}
