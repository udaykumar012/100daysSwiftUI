//
//  AddressModel.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import Foundation

class AddressModel :  ObservableObject{
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
}
