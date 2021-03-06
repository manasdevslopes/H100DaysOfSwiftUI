//
//  FilteringFetchRequestUsingNSPredicate.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//
import CoreData
import SwiftUI

struct FilteringFetchRequestUsingNSPredicate: View {
    @Environment(\.managedObjectContext) var moc2
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: nil) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc2)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc2)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.moc2)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc2)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.moc2.save()
            }
        }
    }
}

struct FilteringFetchRequestUsingNSPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FilteringFetchRequestUsingNSPredicate()
    }
}
