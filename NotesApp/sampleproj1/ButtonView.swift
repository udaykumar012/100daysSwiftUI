//
//  ButtonView.swift
//  sampleproj1
//
//  Created by Uday Kumar Kotla on 15/05/23.
//

import SwiftUI

struct ButtonView: View {
    var action : ()->Void
    var btn : String
    var body: some View {
        ZStack{
            Button{
                action()
                
            }label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                    Text(btn)
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {
            print("action done")
        }, btn: "button")
    }
}
