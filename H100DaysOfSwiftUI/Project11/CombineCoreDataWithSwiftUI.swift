//
//  SwiftUIView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 11/02/21.
//

import SwiftUI

struct CombineCoreDataWithSwiftUI: View {
    //Managed Object Context
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Student.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.name, ascending: true)]) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                //Or,
//                let chosenFirstName = firstNames.randomElement() ?? ["Ginny", "Harry", "Hermione", "Luna", "Ron"].randomElement()
//                let chosenLastName = lastNames.randomElement() ?? ["Granger", "Lovegood", "Potter", "Weasley"].randomElement()

                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? self.moc.save()
            }
        }
    }
}
    
    struct CombineCoreDataWithSwiftUI_Previews: PreviewProvider {
        static var previews: some View {
            CombineCoreDataWithSwiftUI()
        }
    }
