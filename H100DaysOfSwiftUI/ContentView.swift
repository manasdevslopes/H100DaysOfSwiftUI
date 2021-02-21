//
//  ContentView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct ContentView: View {
    let context = Persistent.persistentContainer.viewContext
    
    var body: some View {
        BookWorm()
            .environment(\.managedObjectContext, context)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
