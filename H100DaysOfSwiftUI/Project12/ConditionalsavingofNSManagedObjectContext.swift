//
//  ConditionalsavingofNSManagedObjectContext.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//

import SwiftUI

struct ConditionalsavingofNSManagedObjectContext: View {
    @Environment(\.managedObjectContext) var moc1
    
    var body: some View {
        Button("Save") {
            if self.moc1.hasChanges {
                try? self.moc1.save()
            }
        }
    }
}

struct ConditionalsavingofNSManagedObjectContext_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalsavingofNSManagedObjectContext()
    }
}
