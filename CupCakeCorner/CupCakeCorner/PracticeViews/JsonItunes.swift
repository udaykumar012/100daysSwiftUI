//
//  pracView2.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 05/07/23.
//

import SwiftUI
/*
struct Result : Codable{
    var id : Int
    var name : String
    var email : String
    var company : Company
}
struct Company : Codable{
    var name:String
}
 */

struct Response:Codable{
    var results : [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    
}
struct pracView2: View {
    @State private var result = [Result]()
    func loadData() async{
        //async func are those where getting data takes sometime or the func may sleep some time on that time you can perform other functions
        
        print("started....")
        //3 steps
        //1)reading url //jsonplaceholder.typicode.com/users
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&limit=5")
        else{
            print("Invalid URL unable to respond")
            return
        }
        do{
            //2)fetching url
            let (data1,_) = try await URLSession.shared.data(from: url)
            print(data1)
            //3) decode reesult of data
            if let decodeResponse =  try? JSONDecoder().decode(Response.self, from: data1){
                result = decodeResponse.results
                print(result)
                print("ended...")
            }else{
                print("not decoded")
            }
           
            
        }catch{
            print("Invalid data")
        }
        
    }
    
    var body: some View {
        VStack {
            List(result,id: \.trackId){
                res in
                Section {
                    Text(res.trackName)
                    
                } header: {
                    Text("\(res.trackId)")
                }

            }
            .task {
                //in swift ui to handle async on view we use task modifier instead of onAppear...
                
               await loadData()//await for async func
            }
            
            
        }
        
    }
}

struct pracView2_Previews: PreviewProvider {
    static var previews: some View {
        pracView2()
    }
}
