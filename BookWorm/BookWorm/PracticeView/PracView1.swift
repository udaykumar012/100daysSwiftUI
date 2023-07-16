//
//  PracView1.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import SwiftUI

struct PracView1: View {
    @State var isRemeber = false
    var body: some View {
        VStack{
            PushButtonView(title: "Remeber me",isOn: $isRemeber)
            Text(isRemeber ? "Remebered" : "forgot")
        }
    }
}

struct PracView1_Previews: PreviewProvider {
    static var previews: some View {
        PracView1()
    }
}
