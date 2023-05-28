//
//  MainAppView.swift
//  BetterRest
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import CoreML
import SwiftUI

struct MainAppView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount  = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    func calculateBedtime() {
        do{
            let config = MLModelConfiguration()
            let model = try BetterRest(configuration: config) // BetterRest.mlmodel
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch{
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Divider()
                    .background(Color.orange.opacity(0.2))
                
                ScrollView{
                    VStack(alignment: .leading) {
                        Text("When do you want to wake up?")
                            .font(.headline)

                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()

                        Text("Desired amount of sleep")
                            .font(.headline)

                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            .background()
                            
                        
                        Text("Daily coffee intake")
                            .font(.headline)

                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)

                    }
                        .toolbar {
                            Button("Calculate", action: calculateBedtime)
                               
                        }.padding()
                        .alert(alertTitle, isPresented: $showingAlert) {
                        Button("OK") { }
                    } message: {
                        Text(alertMessage)
                    }
                }.navigationTitle("BetterRest")
            }
            
        }
        
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
