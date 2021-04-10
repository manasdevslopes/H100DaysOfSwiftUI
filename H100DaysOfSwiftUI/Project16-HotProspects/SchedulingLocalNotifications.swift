//
//  SchedulingLocalNotifications.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 10/04/21.
//

import UserNotifications
import SwiftUI

struct SchedulingLocalNotifications: View {
    var body: some View {
        HStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success , error in
                    if success {
                        print("All Set.....!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            .background(Color.orange)
            Spacer()
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungary"
                content.sound = UNNotificationSound.default
                
                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // choose a random identifier -  UUID is required so that we can edit or remove specific alerts later on. if we don't want to edit or remove stuff, use UUID().uuidString to get a random identifier.
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
                
            }
            .padding()
            .foregroundColor(Color.pink)
            .background(Color.yellow)
        }
    }
}

struct SchedulingLocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingLocalNotifications()
    }
}
