//
//  EditFoodView.swift
//  iCalories
//
//  Created by Uday Kumar Kotla on 16/07/23.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var food : FetchedResults<Food>.Element
    @State private var name = ""
    @State private var calories : Double = 0
    var body: some View {
        Form{
            Section{
                TextField("\(food.name!)", text: $name).autocorrectionDisabled()
                    .autocapitalization(.none)
                    .onAppear {
                        name = food.name!
                        calories=food.calories
                    }
                VStack{
                    Text("Calories : \(Int(calories))")
                    Slider(value: $calories, in: 0...100,step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().editFood(food: food, name: name, calories: calories, context: moc)
                        dismiss()
                    }
                    Spacer()
                }
            }
            
        }
    }
}


