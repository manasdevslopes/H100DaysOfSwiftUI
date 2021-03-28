//
//  DynamicFiltering.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 20/03/21.
//

import SwiftUI

struct DynamicFiltering: View {
    @Environment(\.managedObjectContext) var moc4
    @State private var lastNameFilter = "A"
    var body: some View {
        VStack {
            // list of matching singers
            //            FilteredList(filter: lastNameFilter)
            
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Examples") {
                let taylor = Singer(context: self.moc4)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc4)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc4)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc4.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFiltering_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFiltering()
    }
}
