//
//  project.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 24/01/21.
//

import SwiftUI

struct project: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        //Calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var totalAmount:Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                        .lineLimit(1)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    Text("Number of People : \(numberOfPeople)")
                }
                Section(header: Text("Tip Percentage"), footer: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Text("Number of People : \(numberOfPeople)")
                Text("Tip: \(tipPercentage); Tip% \(tipPercentages[tipPercentage])")
                
                Section(header: Text("Grand Total")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                Section(header: Text("%g removes unwanted 0 after decimal")) {
                    Text("$\(totalAmount, specifier: "%g")")
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("We Split")
        }
    }
}

struct project_Previews: PreviewProvider {
    static var previews: some View {
        project()
    }
}
