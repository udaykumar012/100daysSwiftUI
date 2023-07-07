//
//  pracView3.swift
//  CupCakeCorner
//
//  Created by Uday Kumar Kotla on 05/07/23.
//

import SwiftUI

struct  BooksResponse : Codable{
    var books : [Book]
}
struct Book : Codable{
    var isbn : String
    var title : String
    var author : String
    var description : String
}

struct JSONbookView3: View {
    @State private var myBooks = [Book]()
    func loadBookData() async{
        //3 steps
        //read url
        //fetch url
        //decode url
        
        guard let Bookurl = URL(string: "https://gist.githubusercontent.com/nanotaboada/6396437/raw/855dd84436be2c86e192abae2ac605743fc3a127/books.json")
        else{
            
            print("invalid url")
            return
        }
        
        do{
            let (bookdata,_) = try await URLSession.shared.data(from: Bookurl)
            
            if let decodeResponse = try? JSONDecoder().decode(BooksResponse.self, from: bookdata){
                myBooks = decodeResponse.books
            }
            else{
                print("Not decoded")
            }
            
        }catch{
            print("invalid data")
        }
    }
    var body: some View {
        VStack{
            List(myBooks, id:\.isbn) {
                bk in
                Section {
                    Text(bk.author).bold().foregroundColor(.red)
                    Text(bk.description)
                } header: {
                    Text(bk.title)
                }

                
            }.task {
                await loadBookData()
            }
        }
    }
}

struct JSONbookView3_Previews: PreviewProvider {
    static var previews: some View {
        JSONbookView3()
    }
}
