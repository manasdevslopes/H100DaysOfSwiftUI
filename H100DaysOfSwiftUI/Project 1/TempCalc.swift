//
//  TempCalc.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct TempCalc: View {
    @State private var checkTemp = ""
    @State private var selectedTemperature = 0
    @State private var finalTemperature = 0
    let tipInitialTemperature = ["Celcius", "Farheneit", "Kelvin"]
    let tipFinalTemperature = ["Celcius", "Farheneit", "Kelvin"]
    var conversion: Double{
        let unitToConvert = Double(checkTemp) ?? 0
        switch (selectedTemperature, finalTemperature) {
        case (0,1):
            // c -> f
            return unitToConvert * 1.8 + 32
        case (0,2):
            // c -> k
            return unitToConvert + 273.15
        case (1,0):
            // f -> c
            return (unitToConvert - 32) * 1.8
        case (1,2):
            // f -> k
            return (unitToConvert - 32) * 1.8 + 273.15
        case (2,0):
            // k -> c
            return unitToConvert - 273.15
        case (2,1):
            // k -> f
            return (unitToConvert - 273.15) * 1.8 + 32
        default:
            return unitToConvert
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter the Temperature")) {
                    TextField("Temperature", text: $checkTemp)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Select Your Unit")) {
                    Picker("Initial Temperature", selection: $selectedTemperature) {
                        ForEach(0 ..< tipInitialTemperature.count) {
                            Text("\(self.tipInitialTemperature[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Select Your Unit For Conversion")) {
                    Picker("Final Temperature", selection: $finalTemperature) {
                        ForEach(0 ..< tipInitialTemperature.count) {
                            Text("\(self.tipInitialTemperature[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Temperature after conversion")) {
                    Text("\(conversion, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temperature Calculator",displayMode: .inline)
        }
    }
}

struct TempCalc_Previews: PreviewProvider {
    static var previews: some View {
        TempCalc()
    }
}
