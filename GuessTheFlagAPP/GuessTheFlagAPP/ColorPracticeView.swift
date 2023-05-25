//
//  ColorPracticeView.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 23/05/23.
//

import SwiftUI

struct ColorPracticeView: View {
    var body: some View {
        ZStack{
           
            VStack(spacing: 0){
                Color.red
                Color.blue
                Color(red:0.2,green:0.6, blue: 0.3 )
            }
            VStack{
                VStack(alignment: .leading){
                    Text("Add Border")
            
                }
                .font(.title)
                .foregroundStyle(.ultraThickMaterial)
                .frame(maxWidth: .infinity)
                .background(.black)
                .padding(.top)
                Text("Colors and Frames")
                    .padding(50)
                    .foregroundStyle(.ultraThinMaterial)
                    .background(.secondary)
            }
        }.ignoresSafeArea()
    }
}

struct ColorPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPracticeView()
    }
}
