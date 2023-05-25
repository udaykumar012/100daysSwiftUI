//
//  ContentView.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 23/05/23.
//

import SwiftUI

struct ContentView: View {
   
  
    var body: some View {
        VStack{
            MainAppView()
        }
        .padding()
        .background(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
