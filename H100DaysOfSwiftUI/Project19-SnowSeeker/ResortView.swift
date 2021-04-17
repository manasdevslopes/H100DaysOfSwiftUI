//
//  ResortView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 17/04/21.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var favorites: Favorites
    @State private var selectedFacility: Facility?
    
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0.0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack(alignment:.leading) { ResortDetailsView(resort: resort) }
                            VStack(alignment:.leading) { SkiDetailsView(resort: resort) }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                        //                        Spacer()
                        //                        ResortDetailsView(resort: resort)
                        //                        SkiDetailsView(resort: resort)
                        //                        Spacer()
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    
                    Text(resort.description).padding(.vertical)
                    Text("Facilities").font(.headline)
                    //                    Text(resort.facilities.joined(separator: ", "))
                    //                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                    //                        .padding(.vertical)
                    HStack {
                        ForEach(resort.facilityTypes){facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                                }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if self.favorites.contains(self.resort) {
                        self.favorites.remove(self.resort)
                    } else {
                        self.favorites.add(self.resort)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
        .alert(item: $selectedFacility) { facility in
            facility.alert
        }
    }
}


struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
