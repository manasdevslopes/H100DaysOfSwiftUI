//
//  HierarchicalCodableData.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/02/21.
//

import SwiftUI

struct HierarchicalCodableData: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            struct User: Codable {
                var name: String
                var address: Address
            }
            struct Address: Codable {
                var street: String
                var city: String
            }
            
            //we can convert our JSON string to the Data type (which is what Codable works with), then decode that into a User instance
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data){
                print(user.name)
                print(user.address.city)
                print(user.address.street)
            }
            
            //There’s no limit to the number of levels Codable will go through – all that matters is that the structs you define match your JSON string.
        }
    }
}

struct HierarchicalCodableData_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodableData()
    }
}
