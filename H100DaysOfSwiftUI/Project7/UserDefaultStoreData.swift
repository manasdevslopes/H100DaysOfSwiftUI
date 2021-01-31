//
//  UserDefaultStoreData.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 31/01/21.
//

import SwiftUI

struct UserDefaultStoreData: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct UserDefaultStoreData_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultStoreData()
    }
}
