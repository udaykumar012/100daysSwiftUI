//
//  PushButtonView.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import SwiftUI

struct PushButtonView: View {
    var title = "PushButton"
    @Binding var isOn : Bool
    var onColor = [Color.blue ,Color.green]
    var offColor = [Color.red,Color.orange]
    var body: some View {
        VStack{
            
            Button(title){
                isOn.toggle()
            }
            .padding()
                .tint(.white).bold()
            .background(LinearGradient(colors: isOn ? onColor : offColor, startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 200))
        }
    }
}

struct PushButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PushButtonView(isOn: .constant(true))
    }
}
