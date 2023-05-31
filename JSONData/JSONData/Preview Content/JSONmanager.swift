//
//  JSONmanager.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import Foundation

//codable for encode and decode json data
//identifiable for instances hold the value of an entity with stable ids
struct Book : Codable ,Identifiable,Hashable{
    var id  = UUID().uuidString
    let author, country: String
    let imageLink: String
    let language: String
    let link: String
    let pages: Int
    let title: String
    let year: Int
}
class Api : ObservableObject{
    @Published var books : [Book] = []
    
    func loadData(completion:@escaping ([Book]) -> ()) {
        guard let url = URL(string: "https://gist.githubusercontent.com/Richardtex22/04b9c712aa3b1371d296a739dafe14a7/raw/e49687d95377ff8748fd105642fed2af2bab30b5/books.json") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            let books = try! JSONDecoder().decode([Book].self, from: data!)
            print(books)
            DispatchQueue.main.async {
                completion(books)
            }
        }.resume()
        
    }
}
var noBookItem = Book(id: "nill", author: "abc", country: "xyz", imageLink: "123", language: "abc", link: "xyz", pages: 0, title: "abx", year:9999)
