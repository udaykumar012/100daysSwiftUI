//
//  JSONmanger.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import Foundation

struct UserDetails : Codable {
    var firstName , surname , gender : String
    var age : Int
    var address : Address
    var phoneNumbers : [PhoneNumber]
    
    static let users : [UserDetails] = Bundle.main.decode(file: "example.json")
}
struct Address : Codable{
    var streetAddress , city ,state : String
    var postalCode : String
}
struct PhoneNumber : Codable{
    var type , number : String
}

// Extension to decode JSON locally
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}

