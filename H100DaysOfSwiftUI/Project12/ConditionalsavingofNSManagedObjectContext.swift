//
//  ConditionalsavingofNSManagedObjectContext.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//

import SwiftUI

struct ConditionalsavingofNSManagedObjectContext: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct ConditionalsavingofNSManagedObjectContext_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalsavingofNSManagedObjectContext()
    }
}
