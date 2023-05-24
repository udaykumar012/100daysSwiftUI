//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Uday Kumar Kotla on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmt : Double = 0.0
    @State private var noOfPeople = 2
   
    @State private var tipPercent = 8
    //@FocusState private var amtFocus : Bool
    let tippercentages = [0,8,10,15]
    var totalAndCostPerPerson : (total : Double,cpp : Double) {
        let pepCou = Double(noOfPeople + 2)
        let tipValue = checkAmt * Double(tipPercent)/100
        let totalcost = checkAmt + tipValue
        let cpp = totalcost / pepCou
        return (totalcost,cpp)
    }
    var body: some View {
    VStack {
        NavigationView{
            Form{
                
                Section{
                    
                    TextField("Amount",value: $checkAmt ,format: .currency(code: Locale.current.currency?.identifier ?? "Usd"))
                        .keyboardType(.decimalPad)
                        //.focused($amtFocus)
                        
                    //.currency?.identifier or currencyCode
                    Picker("Number of people", selection: $noOfPeople) {
                        ForEach(2..<20){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(NavigationLinkPickerStyle())
                    //Text("\(noOfPeople)")  result 2 but picker shows 4
                    //here the value be the index for picker and it like value of index at picker[2] = 4 visible like this but the at selecting picker value 4  the number of people is 2
                    
                }header: {
                    Text("Enter bill and split the Bill")
                }
                Section{
                    
                    Picker("Tip Percentage" , selection: $tipPercent){
                        ForEach(tippercentages,id: \.self){
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }header: {
                    Text("How much tip do you wnt to leave?")
                }
                
                
            }
            //.toolbar{
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Done"){
//                        amtFocus = false
//                    }
//
//                }
//            }
            .navigationBarTitle("We Split")
            //.navigationTitle("We Split")
           
        }
        
            NavigationView{
                
                Form{
                    Group{
                        LabeledContent("Amount", value: "\(checkAmt)" )
                      
                        LabeledContent("Tip percentage", value: "\(tipPercent)")
                    }
                    Section{
                        Text(totalAndCostPerPerson.cpp,format:.currency(code: "USD"))
                    }header: {
                        Text("Cost Per Head (cpp)")
                    }
                   
                    Section{
                        Text(totalAndCostPerPerson.total,format:.currency(code: "USD")).foregroundColor(.white)
                    }
                header: {
                        HStack{
                            Text("Total amount to be paid   ")
                            Spacer()
                            Text("= cpp * \(noOfPeople + 2)")
                            
                        }
                    }
                
                .listRowBackground(Color.red)
                    
                    
                }
                
                .foregroundColor(.black)
                .background(Color.cyan)
                    .scrollContentBackground(.hidden) //to display background
                .navigationBarTitle("Your Bill", displayMode: .automatic)
                //.navigationTitle("Your Bill")
                
                
            }
        
    }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
