//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orders : OrderModel
    @StateObject var adddress = AddressModel()
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $adddress.name)
                TextField("Street Address", text: $adddress.streetAddress)
                TextField("City", text: $adddress.city)
                TextField("Zip", text: $adddress.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(address: adddress)
                } label: {
                    Text("checkout").foregroundColor(disabledCheckout ? .black : .blue)
                }.disabled(disabledCheckout)
            }
            
        }
        
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var disabledCheckout : Bool {
        if(adddress.name.isEmpty || adddress.streetAddress.isEmpty || adddress.city.isEmpty || adddress.zip.isEmpty){
            return true
        }
        return false
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(orders: OrderModel())
    }
}
