//
//  TriggerEventsWithTimer.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 13/04/21.
//

import SwiftUI

struct TriggerEventsWithTimer: View {
    let timer = Timer.publish(every: 1,tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) {time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now: \(time)")
                }
                self.counter += 1
            }
    }
}

struct TriggerEventsWithTimer_Previews: PreviewProvider {
    static var previews: some View {
        TriggerEventsWithTimer()
    }
}
