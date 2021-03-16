//
//  BetterRest.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 27/01/21.
//

import SwiftUI

struct BetterRest: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var output = "Your ideal bedtime is…"
    
    private var dateProxy:Binding<Date> {
        Binding<Date>(get: {self.wakeUp }, set: {
                self.wakeUp = $0
                self.calculateBedtime()
            })
        }
    
    
    var body: some View {
        let now = Date()
        let tomorrow = Date().addingTimeInterval(86400)
        let _ = now ... tomorrow

        return NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .onTapGesture {
                            self.calculateBedtime()
                        }
//                    
//                    DatePicker("Please enter a time", selection: dateProxy, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                        .datePickerStyle(WheelDatePickerStyle())
//                        .onTapGesture {
//                            self.calculateBedtime()
//                        }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                    //                    Stepper(onIncrement: {
                    //                        print("Stepper onIncrement")
                    //                        self.sleepAmount += 1
                    //                        self.calculateBedtime()
                    //                    }, onDecrement: {
                    //                        print("Stepper onDecrement")
                    //                        self.sleepAmount -= 1
                    //                        self.calculateBedtime()
                    //                    }) {
                    //                        Text("\(sleepAmount, specifier: "%g") hours")
                    //                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                    
                    //                    Stepper(onIncrement: {
                    //                        print("Stepper onIncrement")
                    //                        self.coffeeAmount += 1
                    //                        self.calculateBedtime()
                    //                    }, onDecrement: {
                    //                        print("Stepper onDecrement")
                    //                        self.coffeeAmount -= 1
                    //                        self.calculateBedtime()
                    //                    }) {
                    //                        if coffeeAmount == 1 {
                    //                            Text("1 cup")
                    //                        } else {
                    //                            Text("\(coffeeAmount) cups")
                    //                        }
                    //                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(output).font(.headline)
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                                    Button(action: calculateBedtime) {
                                        Text("Calculate")
                                    }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is…"
            output = "Your ideal bedtime is… \(formatter.string(from: sleepTime))"
        } catch {
            // something went wrong!
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            output = "Sorry, there was a problem calculating your bedtime."
        }
        //        showingAlert = true
    }
}

struct BetterRest_Previews: PreviewProvider {
    static var previews: some View {
        BetterRest()
    }
}
