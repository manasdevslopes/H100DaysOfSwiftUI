//
//  ContentView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct ContentView: View {
    //    let context = Persistent.persistentContainer.viewContext
    
    var body: some View {
        //        FilteringFetchRequestUsingNSPredicate()
        //            .environment(\.managedObjectContext, context)
        //        EnsuringCoreDataObjectsAreUniqueUsingConstraints()
        //            .environment(\.managedObjectContext, context)
        Flashzilla()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
