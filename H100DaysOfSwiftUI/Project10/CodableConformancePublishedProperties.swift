///Users/manasvijaywargiya/Desktop/H100DaysOfSwiftUI/H100DaysOfSwiftUI/Project8/Mission.swift
//  CupcakeCorner.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/02/21.
//

import SwiftUI

class User3: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Manas Vijaywargiya"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
struct CodableConformancePublishedProperties: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct CodableConformancePublishedProperties_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformancePublishedProperties()
    }
}
