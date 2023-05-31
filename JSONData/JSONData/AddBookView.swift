//
//  AddBookView.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 30/05/23.
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var books :  BookModel
    @State private var bookTitle = ""
    @State private var author = ""
    @State private var country = ""
    @State private var language = ""
    @State private var pages :  Int?
    @State private var year: Int?
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    LabeledContent("Books count", value: "\(books.allBooks.count)")
                    Group{
                        Section{
                            TextField("Book title", text:$bookTitle)
                        }header: {
                            Text("Book Title")
                        }
                        Section{
                            TextField("Book Author", text:$author)
                        }header: {
                            Text("Author")
                        }
                        Section{
                            TextField("Country", text:$country)
                        }header: {
                            Text("Country")
                        }
                    }
                    Group{
                        Section{
                            TextField("Language", text:$language)
                        }header: {
                            Text("Language")
                        }
                        Section {
                            TextField("Pages", value: $pages, format: .number)
                        }header: {
                            Text("Pages")
                        }
                        Section {
                            TextField("Year", value: $year, format: .number)
                        }header: {
                            Text("Year")
                        }
                    }
                }
                .navigationBarTitle("Add Books")
                
            }
            VStack{
                Button("ADD"){
                    let newBookItem = Book(author: author, country: country, imageLink: "https://unsplash.com/photos/9DaOYUYnOls", language: language, link: "https://en.wikipedia.org/wiki/Fairy_Tales_Told_for_Children._First_Collection.\n", pages: pages!, title: bookTitle, year:year!)
                    books.allBooks.append(newBookItem)
                    
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(books:BookModel())
    }
}
