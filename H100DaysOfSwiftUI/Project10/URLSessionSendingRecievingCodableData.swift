//
//  URLSessionSendingRecievingCodableData.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/02/21.
//

import SwiftUI

struct Response: Codable {
    var results: [Result11]
}
struct Result11: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct URLSessionSendingRecievingCodableData: View {
    @State var results = [Result11]()
    
    var body: some View {
        List(results, id: \.trackId) {item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        //TODO: - 1. Creating the URL we want to read.
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        //TODO: - 2.
        let requestUrl = URLRequest(url: url)
        //TODO: - 3.
        URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedResponse = try? decoder.decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }
                    // everything is good, so we can exit
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
            //TODO: - 4.
        }.resume()
    }
}

struct URLSessionSendingRecievingCodableData_Previews: PreviewProvider {
    static var previews: some View {
        URLSessionSendingRecievingCodableData()
    }
}
