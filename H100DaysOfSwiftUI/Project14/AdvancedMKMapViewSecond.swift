//
//  AdvancedMKMapViewSecond.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/04/21.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct AdvancedMKMapViewSecond: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showingEditScreen = false
    
    @State private var isUnlocked = false
    
    var body: some View {
        ZStack {
            if isUnlocked {
                AdvancedMKMapView(centerCoordinate: $centerCoordinate,selectedPlace: $selectedPlace,showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // create a new location
                            let newLocation = CodableMKPointAnnotation()
                            newLocation.title = "Example location"
                            newLocation.coordinate = self.centerCoordinate
                            self.locations.append(newLocation)
                            
                            self.selectedPlace = newLocation
                            self.showingEditScreen = true
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                // edit this place
                self.showingEditScreen = true
            })
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: savedData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func loadData() {
        let fileName = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        do {
            let data = try Data(contentsOf: fileName)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
            print("Data Loaded")
        } catch {
            print("Unable to load saved data")
        }
    }
    
    func savedData() {
        do {
            let fileName = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            print("Saved Data")
        } catch {
            print("Unable to save data.")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                        print(authenticationError?.localizedDescription ?? "")
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct AdvancedMKMapViewSecond_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedMKMapViewSecond()
    }
}
