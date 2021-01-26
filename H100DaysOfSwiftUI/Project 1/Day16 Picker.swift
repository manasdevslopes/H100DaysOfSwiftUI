//
//  Day16 Picker.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct Day16_Picker: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
//            Form {
                Picker("Select your student", selection: $selectedStudent){
                    ForEach(0 ..< students.count){
                        Text(self.students[$0])
                    }
                }
//            }
            Text("You chose: Student # \(students[selectedStudent])")
            Text("You chose: number # \(selectedStudent)")
        }
    }
}

struct Day16_Picker_Previews: PreviewProvider {
    static var previews: some View {
        Day16_Picker()
    }
}
