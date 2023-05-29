//
//  LazyVHgridView.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 29/05/23.
//

import SwiftUI
let coloumnLayout = Array(repeating: GridItem(spacing:10), count: 4)
let rowLayout = Array(repeating: GridItem(.fixed(80)), count: 4)
struct LazyVHgridView: View {
    var body: some View {
        VStack{
            Text("Lazy V Grid")
            ScrollView{
                LazyVGrid(columns: coloumnLayout) {
                    ForEach(1..<10){ num in
                        Image(systemName: "\(num).square.fill")
                            .resizable()
                            .scaledToFit()
                        
                    }
                }
                
            }
            Text("Lazy H Grid")
            ScrollView(.horizontal){
                LazyHGrid(rows:rowLayout){
                    ForEach(1..<10){ num in
                        Image(systemName: "\(num).square.fill")
                            .resizable()
                            .scaledToFit()
                           
                            
                            
                    }
                }
            }
        }
    }
}

struct LazyVHgridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVHgridView()
    }
}
