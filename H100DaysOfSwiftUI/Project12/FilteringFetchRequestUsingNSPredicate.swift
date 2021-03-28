//
//  FilteringFetchRequestUsingNSPredicate.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//
import CoreData
import SwiftUI

struct FilteringFetchRequestUsingNSPredicate: View {
    @Environment(\.managedObjectContext) var moc3
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var ships: FetchedResults<Ship>
    
    //Normal,
    //NSPredicate(format: "universe == 'Star Wars'"))
    
    
    //That gets complicated if your data includes quote marks, so it’s more common to use special syntax instead: `%@‘ means “insert some data here”, and allows us to provide that data as a parameter to the predicate rather than inline.
    //NSPredicate(format: "universe == %@", "Star Wars"))
    
    //As well as ==, we can also use comparisons such as < and > to filter our objects. For example this will return Defiant, Enterprise, and Executor:
    //NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
    
    
    //%@ is doing a lot of work behind the scenes, particularly when it comes to converting native Swift types to their Core Data equivalents. For example, we could use an IN predicate to check whether the universe is one of three options from an array, like this:
    //NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
    
    
    //We can also use predicates to examine part of a string, using operators such as BEGINSWITH and CONTAINS. For example, this will return all ships that start with a capital E:
    //NSPredicate(format: "name BEGINSWITH %@", "E"))
    
    
    //That predicate is case-sensitive; if you want to ignore case you need to modify it to this:
    //NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
    
    //CONTAINS[c] works similarly, except rather than starting with your substring it can be anywhere inside the attribute.
    
    
    //Finally, you can flip predicates around using NOT, to get the inverse of their regular behavior. For example, this finds all ships that don’t start with an E:
    
    //NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))
    
    
    //If you need more complicated predicates, join them using AND to build up as much precision as you need, or add an import for Core Data and take a look at NSCompoundPredicate – it lets you build one predicate out of several smaller ones.
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc3)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc3)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.moc3)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc3)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.moc3.save()
            }
        }
    }
}

struct FilteringFetchRequestUsingNSPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FilteringFetchRequestUsingNSPredicate()
    }
}
