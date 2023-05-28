//
//  SteeperPracticeView.swift
//  BetterRest
//
//  Created by Uday Kumar Kotla on 27/05/23.
//

import SwiftUI

struct SteeperPracticeView: View {
    @State var num = 8.0
    var body: some View {
        ZStack{
            Color.red
            VStack{
                VStack{
                    
                    Stepper(value: $num,in:4...12,step: 0.25) {
                        Text("\(num.formatted())")
                      
                        
                    }
                    
                    //or
                    Stepper("\(num.formatted())", value:$num, in:4...12,step: 0.5)
                }
            }.padding()
            .background(.white)
                
            
        }.ignoresSafeArea()
    }
}

struct SteeperPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        SteeperPracticeView()
    }
}
