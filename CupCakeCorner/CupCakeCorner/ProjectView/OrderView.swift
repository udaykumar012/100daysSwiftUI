//
//  OrderView.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import SwiftUI


struct OrderView: View {
    @StateObject var order = OrderModel()
    var body: some View {
        VStack{
            NavigationView {
                Form{
                    Section{
                        Picker("Select Your Cake", selection: $order.type) {
                            ForEach(0..<OrderModel.types.count, id: \.self){
                                ind in
                                Text(OrderModel.types[ind])
                            }
                            
                        }.pickerStyle(.navigationLink)
                        Stepper("Number of cakes : \(order.quantity)", value: $order.quantity,in: 3...10)
                        
                    }
                    Section{
                        Toggle("Any Special Reques", isOn: $order.specialRequestEnabled)
                            .listRowBackground(Color.gray.opacity(order.specialRequestEnabled ? 0.4 : 0))
                        if(order.specialRequestEnabled){
                            Toggle(isOn: $order.extraFrosting) {
                                Text("Add Extra Frosting")
                            }
                            Toggle(isOn: $order.addSprinkles) {
                                Text("Add Extra Sprinkles")
                            }
                        }
                       
                    }
                    Section{
                        NavigationLink{
                            AddressView(orders: order)
                        }label: {
                            Text("Delivery Address")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .navigationTitle("Cupcake Corner")
            }
        }
        .environmentObject(order)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
