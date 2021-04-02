//
//  UsingTouchIDAndFaceID.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/04/21.
//

import LocalAuthentication
import SwiftUI

// TODO : - edit PList for Touch ID and Face ID
 
struct UsingTouchIDAndFaceID: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // authenticated succesfully
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                        print(authenticationError?.localizedDescription ?? "")
                    }
                }
            }
        } else {
            // Other than biometrics
            
        }
    }
}

struct UsingTouchIDAndFaceID_Previews: PreviewProvider {
    static var previews: some View {
        UsingTouchIDAndFaceID()
    }
}
