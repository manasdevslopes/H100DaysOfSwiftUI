//
//  FilteredList.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 20/03/21.
//
import CoreData
import SwiftUI

//struct FilteredList: View {
//    var fetchRequest: FetchRequest<Singer>
//    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
//
//    var body: some View {
//        List(fetchRequest.wrappedValue, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//
//    init(filter: String) {
//        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//        //NSPredicate(format: "%@ BEGINSWITH %@", keyName, filter)
//
//        //However, that won’t work. You see, when we write %@ Core Data automatically inserts quote marks for us so that the predicate reads correctly. This is helpful, because if our string contains quote marks it will automatically make sure they don’t clash with the quote marks it adds.
//
////        This means when we use %@ for the attribute name we might end up with a predicate like this:
//
//        //NSPredicate(format: "'lastName' BEGINSWITH 'S'")
//
//        //And that’s not correct: the attribute name should not be in quote marks.
//
////        To resolve this, NSPredicate has a special symbol that can be used to replace attribute names: %K, for “key”. This will insert values we provide, but won’t add quote marks around them. The correct predicate is this:
//
//        //NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
//
//    }
//
//}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
