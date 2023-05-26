//
//  ViewComposition.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 26/05/23.
//

import SwiftUI
struct Custom : View{
    var text : String = ""
    var body: some View{
        Text(text)
            .font(.largeTitle.bold())
            .padding()
            .foregroundColor(.red)
            .background(.green)
    }
}
struct ViewComposition: View {
    var body: some View {
        VStack{
            Custom(text: "Custom View")
            Custom(text: "call from main view")
        }
        
    }
}

struct ViewComposition_Previews: PreviewProvider {
    static var previews: some View {
        ViewComposition()
    }
}
