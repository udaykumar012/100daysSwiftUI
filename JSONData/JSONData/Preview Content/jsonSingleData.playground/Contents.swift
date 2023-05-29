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
}
struct Address : Codable{
    var streetAddress , city ,state : String
    var postalCode : String
}
struct PhoneNumber : Codable{
    var type , number : String
}
func fetchDataFromRemote() {
    let jsonString =
        """
        [
                   {
                       "firstName": "Mario",
                       "surname": "Pomodoro",
                       "gender": "Male",
                       "age": 24,
                       "address": {
                           "streetAddress": "Via Mushroom 126",
                           "city": "Mushroom City",
                           "state": "Mushroom Kingdom",
                           "postalCode": "111222"
                       },
                       "phoneNumbers": [
                           { "type": "home", "number": "+390212345678" }
                       ]
                   },
           {
               "firstName": "Mario",
               "surname": "Pomodoro",
               "gender": "Male",
               "age": 24,
               "address": {
                   "streetAddress": "Via Mushroom 126",
                   "city": "Mushroom City",
                   "state": "Mushroom Kingdom",
                   "postalCode": "111222"
               },
               "phoneNumbers": [
                   { "type": "home", "number": "+390212345678" }
               ]
           }
        ]
        """
    if let jsonData = jsonString.data(using: String.Encoding.utf8) as? Data {
        
        let decoder = JSONDecoder()
        do{
            let product = try decoder.decode([UserDetails].self, from: jsonData)
            
            print(product)
            print("************************")
            
            
        }
        catch{
            print("UserDetails cannot be parsed as JSON data")
        }
    }
    
}
fetchDataFromRemote()

