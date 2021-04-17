//
//  SnowSeeker.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 17/04/21.
//

import SwiftUI

struct SnowSeeker: View {
    @ObservedObject var favorites = Favorites()
    let resort: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            List(resort) {resort in
                NavigationLink(destination: ResortView(resort: resort)){
                    Image(resort.country)
                        .resizable().scaledToFill()
                        .frame(width:40, height:25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth:1)
                        )
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                            .layoutPriority(1)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                            .layoutPriority(1)
                    }

                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            
            WelcomeView()
        }
        .environmentObject(favorites)
        .phoneOnlyStackNavigationView()
    }
}


//The first two of those might seem backwards, but it’s a result of Apple’s slightly odd hardware choices: although the iPhone 11 Pro uses a Super Retina display at 3x resolution it is physically smaller than the iPhone 11’s 2x display, so Apple considers it too small to support the slide over ContentView.

//Although UIKit lets us control whether the primary view should be shown on iPad portrait, this is not yet possible in SwiftUI. However, we can stop the iPhone 11 from using the slide over approach if that’s what you want – try it first and see what you think. If you want it gone, add this extension to your project:

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
struct SnowSeeker_Previews: PreviewProvider {
    static var previews: some View {
        SnowSeeker()
    }
}
