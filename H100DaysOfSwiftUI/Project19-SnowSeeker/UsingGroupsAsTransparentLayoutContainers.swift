//
//  UsingGroupsAsTransparentLayoutContainers.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 16/04/21.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct UsingGroupsAsTransparentLayoutContainers: View {
    @State private var layoutVertically = false
    
    // Alternative way
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        //        Group {
        //            if layoutVertically {
        //                VStack {
        //                    UserView()
        //                }
        //            } else {
        //                HStack {
        //                    UserView()
        //                }
        //            }
        //        }
        //        .onTapGesture {
        //            self.layoutVertically.toggle()
        //        }
        
        // Alternate way
        Group {
            if sizeClass == .compact {
//                VStack {
//                    UserView()
//                }
                //Tip: In situations like this, where you have only one view inside a stack and it doesn’t take any parameters, you can pass the view’s initializer directly to the VStack to make your code shorter:
                VStack(content: UserView.init)
            } else {
//                HStack {
//                    UserView()
//                }
                HStack(content: UserView.init)
            }
        }
    }
}

struct UsingGroupsAsTransparentLayoutContainers_Previews: PreviewProvider {
    static var previews: some View {
        UsingGroupsAsTransparentLayoutContainers()
    }
}
