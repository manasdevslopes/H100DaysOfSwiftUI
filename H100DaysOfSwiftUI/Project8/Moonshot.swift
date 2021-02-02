//
//  Moonshot.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/02/21.
//

import SwiftUI


struct Moonshot: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text("\(astronauts.count)")
            Text("\(mission[0].crew[0].role)")
        }
    }
}

struct Moonshot_Previews: PreviewProvider {
    static var previews: some View {
        Moonshot()
    }
}
