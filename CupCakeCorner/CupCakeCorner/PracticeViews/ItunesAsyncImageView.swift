//
//  ItunesAsyncImageView.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 06/07/23.
//

import SwiftUI

struct ItunesAsyncImageView: View {
    @Binding var imgString :String
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imgString)){
                phase in
                if let img = phase.image{
                    img.resizable()
                        .scaledToFit()
                        
                }
                else{
                    ProgressView()
                }
            }.frame(width: 100, height: 100)
        }
    }
}

struct ItunesAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        ItunesAsyncImageView(imgString: .constant("https://is4-ssl.mzstatic.com/image/thumb/Music3/v4/13/60/53/1360536d-30c1-b71b-fac6-0b649b76b31c/859713193161_cover.tif/100x100bb.jpg"))
    }
}
