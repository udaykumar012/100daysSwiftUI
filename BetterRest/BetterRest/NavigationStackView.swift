//
//  NavigationStackView.swift
//  BetterRest
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        
        VStack {
            NavigationStack {
                       VStack(spacing: 0) {
                           Divider()
                               .background(Color.orange.opacity(0.2))
                           
                           ScrollView {
                               ForEach(0 ..< 15) { item in
                                   RoundedRectangle(cornerRadius: 12)
                                       .fill(Color.orange)
                                       .frame(height: 44)
                                       .padding()
                               }
                           }
                       }
                       .navigationTitle("List & NavView")
                   }
            NavigationStack {
                        ScrollView {
                            ForEach(0 ..< 15) { item in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.orange)
                                    .frame(height: 44)
                                    .padding()
                            }
                        }
                        .safeAreaInset(edge: .top) {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack() {
                                    Text("Custom Nav Bar")
                                        .font(.largeTitle.weight(.bold))
                                    Spacer()
                                    Button(action: {}) {
                                        Image(systemName: "wifi")
                                    }
                                }
                                Text("With safeAreaInset you can create your own custom nav bar.")
                                    .font(.caption)
                            }
                            .padding()
                            .background(LinearGradient(colors: [.green.opacity(0.3), .blue.opacity(0.5)],
                                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                                            .overlay(.ultraThinMaterial)
                            )
                        }
                        .navigationBarHidden(true)
                        .tint(.orange)
                    }
            NavigationStack {
                   ZStack {
                       Color.green
                           .opacity(0.1)
                           .ignoresSafeArea()
                       
                       // NavigationView Background
                       VStack {
                           RadialGradient(colors: [.green.opacity(0.3), .blue.opacity(0.5)],
                                          center: .bottomTrailing,
                                          startRadius: 0, endRadius: 300)
                               .ignoresSafeArea(edges: .top)
                               .frame(height: 0)
                           
                           Spacer()
                       }
                       
                       VStack {
                           Text("Use a ZStack to put a background behind the Nav view.")
                               .padding()
                           Spacer()
                       }
                       .navigationTitle("Nav Bar Background")
                       .font(.title2)
                   }
            }
        }
       }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
