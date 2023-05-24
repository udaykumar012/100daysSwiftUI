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
            }
            Text("Colors and Frames")
                .padding(50)
                .foregroundStyle(.ultraThinMaterial)
                .background(.secondary)
                
        }.ignoresSafeArea()
    }
}

struct ColorPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPracticeView()
    }
}
