//
//  Mission.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/02/21.
//

import Foundation

struct CrewRole:Codable {
    let name: String
    let role: String
}
struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}


//TODO: - This is called a nested struct, and is simply one struct placed inside of another. This won’t affect our code in this project, but elsewhere it’s useful to help keep your code organized: rather than saying CrewRole you’d write Mission.CrewRole. If you can imagine a project with several hundred custom types, adding this extra context can really help!

//struct Mission: Codable, Identifiable {
//    struct CrewRole: Codable {
//        let name: String
//        let role: String
//    }
//
//    let id: Int
//    let launchDate: String?
//    let crew: [CrewRole]
//    let description: String
//}
