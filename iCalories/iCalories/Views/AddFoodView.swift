//
//  AddFoodView.swift
//  iCalories
//
//  Created by Uday Kumar Kotla on 14/07/23.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories : Double = 0
    var body: some View {
        Form{
            Section{
                TextField("food title", text: $name).autocorrectionDisabled()
                    .autocapitalization(.none)
                VStack{
                    Text("Calories : \(Int(calories))")
                    Slider(value: $calories, in: 0...100,step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().addFood(name: name, calories: calories, context: moc)
                        dismiss()
                    }
                    Spacer()
                }
            }
            
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
