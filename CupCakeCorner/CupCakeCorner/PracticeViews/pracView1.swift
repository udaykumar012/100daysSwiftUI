//
//  pracView1.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 05/07/23.
//

import SwiftUI

class User: ObservableObject,Codable{
    enum codingKeys:CodingKey{
        case name //key for the property var name
    }
    @Published var name = "uday kumar"
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    func encode(to encoder: Encoder) throws {
        var conrainer = encoder.container(keyedBy: codingKeys.self)
        try conrainer.encode(name, forKey: .name)
        
    }
}

struct pracView1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct pracView1_Previews: PreviewProvider {
    static var previews: some View {
        pracView1()
    }
}
