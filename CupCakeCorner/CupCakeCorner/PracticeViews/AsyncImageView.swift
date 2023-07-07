//
//  AsyncImageView.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
       ScrollView{
            
            Text("1").bold().foregroundColor(.red)
            AsyncImage(url: URL(string: "https://cdn.ytechb.com/wp-content/uploads/2023/05/WWDC-2023-Apple-Logo-Wallpaper-2-768x1024.webp"),scale:4)
           
           
            Text("2").bold().foregroundColor(.red)
            AsyncImage(url: URL(string: "https://cdn.ytechb.com/wp-content/uploads/2023/05/WWDC-2023-Apple-Logo-Wallpaper-2-768x1024.webp")){
                img in
                img
                    .resizable()
                    .scaledToFit()
                    
            }placeholder: {
                ProgressView()//spinner
            }
            .frame(width: 300,height: 300)
            
           Text("3").bold().foregroundColor(.red)
           AsyncImage(url: URL(string: "https://cdn.ytechb.com/wp-content/uploads/2023/05/WWDC-2023-Apple-Logo-Wallpaper-2-768x1024.webp")){
               phase in
               if let img = phase.image{
                   img.resizable()
                       .frame(width: 300,height: 300)
               }
               else if(phase.error != nil){
                   Text("Image Error")
               }
               else{
                   //spinner
                   ProgressView()
               }
           }
           
           
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
