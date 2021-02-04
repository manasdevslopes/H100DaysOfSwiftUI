//
//  Moonshot.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/02/21.
//

import SwiftUI


struct Moonshot: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
//        VStack {
//            Text("\(astronauts.count)")
//            Text("\(missions[0].crew[0].role)")
//        }
        NavigationView {
            List(missions){mission in
                NavigationLink(destination: MissionView(mission:mission, astronauts: self.astronauts) ) {
                    Image(mission.image)
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    VStack(alignment:.leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct Moonshot_Previews: PreviewProvider {
    static var previews: some View {
        Moonshot()
    }
}
