//
//  NotifiedWhenAppMovesToBackground.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 13/04/21.
//

import SwiftUI

struct NotifiedWhenAppMovesToBackground: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    print("Moving to background")
            }
            Text("Hello, World!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    print("Moving to Foreground")
                }
            Text("Hello, World!")
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                    print("User took a screenshot")
                }
        }
    }
}

/**
 
 There are so many of these that I can’t realistically list them all here, so instead here are two more to try out:

 UIApplication.significantTimeChangeNotification is called when the user changes their clock or when daylight savings time changes.
 UIResponder.keyboardDidShowNotification is called when the keyboard is shown.

**/


struct NotifiedWhenAppMovesToBackground_Previews: PreviewProvider {
    static var previews: some View {
        NotifiedWhenAppMovesToBackground()
    }
}
