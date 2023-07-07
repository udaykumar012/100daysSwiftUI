//
//  CheckoutView.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var address : AddressModel
    @EnvironmentObject var order : OrderModel
    @State var isPlaceOrder : Bool = false
    
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    func placeOrder() async{
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            // handle the result
            let decodedOrder = try JSONDecoder().decode(OrderModel.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(OrderModel.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
            print(data)
        } catch {
            print("Checkout failed.")
        }
        
    }
    
    var body: some View {
        VStack{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost(), format: .currency(code: "USD"))")
                    .font(.title)
                if(!isPlaceOrder){
                    Button("Place Order"){
                        Task{
                            await placeOrder()
                        }
                        isPlaceOrder.toggle()
                    }
                    .padding()
                }
                if(isPlaceOrder){
                    Text("Order delivered sucessfully!! ")
                    List{
                        Section {
                            Text(address.name)
                            Text(address.streetAddress)
                            Text(address.city)
                            Text(address.zip)
                        } header: {
                            Text("Address")
                        }

                        
                    }.alert("Thank you!", isPresented: $showingConfirmation) {
                        Button("OK") { }
                    } message: {
                        Text(confirmationMessage)
                    }
                }
            }
        }.navigationTitle("Check out")
            
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(address:  AddressModel()).environmentObject(OrderModel())
    }
}
