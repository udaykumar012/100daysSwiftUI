//
//  GradientPracticeView.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 23/05/23.
//

import SwiftUI

struct GradientPracticeView: View {
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
                    Spacer()
                    Text("Linear").foregroundColor(.white)
                }
                ZStack{
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: .red, location: 0.45),
                        .init(color: .blue, location: 0.55),
                    ]), startPoint: .top, endPoint: .bottom)
                    Text("Linear").foregroundColor(.white)
                }
            }
            HStack{
                ZStack{
                    RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, startRadius: 20, endRadius: 200)
                    Text("Radial").foregroundColor(.white)
                }
                ZStack{
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                    Text("Angular").foregroundColor(.white)
                }

            }
        }
        .ignoresSafeArea()
    }
}

struct GradientPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        GradientPracticeView()
    }
}
