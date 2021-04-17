//
//  UsingAlertAndSheetWithOptionals.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 16/04/21.
//

import SwiftUI

struct User6: Identifiable {
    var id = "Taylor Swift"
}

struct UsingAlertAndSheetWithOptionals: View {
    @State private var selectedUser: User6? = nil
    
    // usual way
    @State private var isShowingAlert = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                self.selectedUser = User6()
                
                // usual way
                self.isShowingAlert = true
            }
            .alert(item: $selectedUser) { user in
                Alert(title: Text(user.id))
            }
            
            // usual way
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text(selectedUser!.id))
//            }
    }
}

struct UsingAlertAndSheetWithOptionals_Previews: PreviewProvider {
    static var previews: some View {
        UsingAlertAndSheetWithOptionals()
    }
}
