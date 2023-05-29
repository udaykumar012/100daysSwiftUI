//
//  BundleUrlView.swift
//  WordScramble
//
//  Created by Uday Kumar Kotla on 29/05/23.
//

import SwiftUI

struct BundleUrlView: View {
    @State var str  : String = ""
    @State var str1  : String = ""
    var body: some View {
        VStack{
            Text(str).font(.largeTitle)
            Text(str1)
                .onAppear(){
                    LoadFile()
                }
            
        }
    }
    func LoadFile(){
        if let fileUrl = Bundle.main.url(forResource: "sample", withExtension: "txt"){
            str = "file exists"
            if let fileContents = try? String(contentsOf: fileUrl){
                str1 = fileContents
            }
            else{
                str1 = "No File Contents"
            }
        }
        else{
            str = "file not exist"
        }
    }
}

struct BundleUrlView_Previews: PreviewProvider {
    static var previews: some View {
        BundleUrlView()
    }
}
