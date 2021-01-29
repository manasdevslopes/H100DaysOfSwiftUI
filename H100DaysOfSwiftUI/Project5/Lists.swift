//
//  List.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 29/01/21.
//

import SwiftUI

struct Lists: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        //TODO: 1 type - mix with static and dynamic data
//        List{
//            Section(header: Text("Section 1")) {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section(header: Text("Section 2")) {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section(header: Text("Section 3")) {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//        }
//        .listStyle(GroupedListStyle())
        
        //TODO: 2 type - dynamic data with numbers
//        List(0..<5) {
//            Text("Dynamic row \($0)")
//        }
//        .listStyle(GroupedListStyle())
        
        
        //TODO: 3 type - only dynamic data with array of data
//        List(people, id: \.self) {
//            Text("\($0)")
//        }
//        .listStyle(GroupedListStyle())
        
        //TODO: 4 type - mix with static and dynamic data with array of data
        List {
            ForEach(people, id: \.self) {
                Text("\($0)")
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
    }
}
