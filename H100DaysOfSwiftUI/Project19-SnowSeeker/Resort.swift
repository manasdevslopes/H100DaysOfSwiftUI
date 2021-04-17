//
//  Resort.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 17/04/21.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
}

//Instead, we have two options. The first option is to add two static properties: one to load all resorts into an array, and one to store the first item in that array, like this:

//static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
//static let example = allResorts[0]



//The second is to collapse all that down to a single line of code. This requires a little bit of gentle typecasting because our decode() extension method needs to know what type of data it’s decoding:
//static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]







