//
//  CodableSwiftObjects.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 31/01/21.
//

import SwiftUI
//Swift gives us a fantastic protocol called Codable: a protocol specifically for archiving and unarchiving data, which is a fancy way of saying “converting objects into plain text and back again.”
struct User2: Codable {
    var firstName: String
    var lastName: String
}

struct CodableSwiftObjects: View {
    @State private var user = User2(firstName: "Manas", lastName: "Vijaywargiya")
    
    var body: some View {
        VStack {
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
        
    }
}

struct CodableSwiftObjects_Previews: PreviewProvider {
    static var previews: some View {
        CodableSwiftObjects()
    }
}
