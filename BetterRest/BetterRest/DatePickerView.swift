//
//  DatePickerView.swift
//  BetterRest
//
//  Created by Uday Kumar Kotla on 27/05/23.
//

import SwiftUI

struct DatePickerView: View {
    @State var dateSelector = Date.now
    var date = Date.now
    var body: some View {
        ZStack{
            Color.yellow
            VStack{
                Text("Today : \(date)")
                    .padding()
                    .background(.green)
                
                
                DatePicker("Enter Date", selection: $dateSelector, in : date..., displayedComponents: .date)
                    .labelsHidden()// to hide string
                    .datePickerStyle(.graphical)
                    .tint(.green)
                    //.background(.white)
                Text("selected date : \(dateSelector)")
                Text("Tomorrow : \(date.addingTimeInterval(86400))")
                    .padding()
                    .background(.green)
            }.frame(maxWidth: .infinity)
                .padding()
                .background()
        }.ignoresSafeArea()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
