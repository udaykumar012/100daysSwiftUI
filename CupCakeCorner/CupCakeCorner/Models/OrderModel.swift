//
//  OrderModel.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import Foundation

class OrderModel : ObservableObject , Codable{
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var type = 1
    @Published var quantity = 3

    @Published var specialRequestEnabled = false{
        didSet{
            if (specialRequestEnabled == false){
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
        @Published var extraFrosting = false
        @Published var addSprinkles = false
    
    
    func cost()-> Double{
        var c : Double = Double(self.quantity*5)
        if(extraFrosting){
            c = c+(2.25*Double(quantity))
        }
        if(addSprinkles){
            c = c+(2.25*Double(quantity))
        }
        
        
        return c
    }
    init(){}
    
    enum ckeys : CodingKey{
        case type,quantity,specialRequestEnabled ,extraFrosting,addSprinkles
    }
    
    func encode(to encoder: Encoder) throws {
        var con = encoder.container(keyedBy: ckeys.self)
        try con.encode(type, forKey: .type)
        try con.encode(quantity, forKey: .quantity)
        try con.encode(extraFrosting, forKey: .extraFrosting)
        try con.encode(addSprinkles, forKey: .addSprinkles)
    }
    required init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: ckeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

    }
}
