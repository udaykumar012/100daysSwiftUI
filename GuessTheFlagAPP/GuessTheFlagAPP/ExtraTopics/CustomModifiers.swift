//
//  CustomModifiers.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 26/05/23.
//

import SwiftUI
//custom modifier use viewModifier protocol
struct Title : ViewModifier{
    // this need to conform func body method
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .padding()
            .foregroundColor(.red)
            .background(.green)
    }
}


// we can use extension to the custom modifiers
extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}
struct CustomModifiers: View {
    var body: some View {
        VStack{
            //1 way
            Text("Hello custom Modifier")
                .modifier(Title())
            
            //after extension
            Text("Modifier in extension")
                .titleStyle()
            
        }
    }
}

struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
