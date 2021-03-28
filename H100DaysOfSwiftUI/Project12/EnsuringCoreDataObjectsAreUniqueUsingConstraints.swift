//
//  EnsuringCoreDataObjectsAreUniqueUsingConstraints.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//
import CoreData
import SwiftUI

struct EnsuringCoreDataObjectsAreUniqueUsingConstraints: View {
    @Environment(\.managedObjectContext) var moc2
    
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.moc2)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try self.moc2.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct EnsuringCoreDataObjectsAreUniqueUsingConstraints_Previews: PreviewProvider {
    static var previews: some View {
        EnsuringCoreDataObjectsAreUniqueUsingConstraints()
    }
}
