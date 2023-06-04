//
//  ListView1.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import SwiftUI

struct MainAppView: View {
    @StateObject var books = BookModel()
    @State var isSelectedBook = false
    @State var selectedBook : Book = noBookItem
    @State var initialLoad  = true
    var body: some View {
        
        TabView {
            VStack(spacing: 0){
                if(isSelectedBook){
                    VStack{
                        Text("You selected book")
                            .font(.title)
                            .bold()
                        BookView(book: $selectedBook)
                    }//.background(Color(red: 0.9, green: 0.9, blue: 0.9))
                }
                NavigationStack{
                    List{
                        ForEach($books.allBooks,id: \.id){ $book in
                            Section{
                                
                                   
                                
                                NavigationLink {
                                    BookView(book: $book)
                                } label: {
                                    BookView(book: $book)
                                        .onTapGesture(count:2){
                                            selectedBook = book
                                            isSelectedBook = true
                                            print(selectedBook.author)
                                            
                                            
                                        }
                                } .listRowBackground(Color(red: 0.9, green: 0.9, blue: 0.9))
                                
                                Link(destination: URL(string: book.imageLink)!) {
                                    Text("Image Link")
                                        .foregroundColor(.white).bold()

                                }
                                .listRowBackground(Color(red: 0, green: 0.5, blue: 1, opacity : 0.9))
                                
                            }
                        header: {
                                Text(" \(book.title)").fontWeight(.heavy)
                            }
                            
                            
                        }
                        .onDelete(){
                            index in
                            books.allBooks.remove(atOffsets: index)
                        }
                        
                    }.onAppear(){
                        if(initialLoad){
                            Api().loadData(completion:{
                                book in
                                books.allBooks.append(contentsOf: book)
                                
                            }
                            )
                            initialLoad = false
                        }
                    }.listStyle(.sidebar)
                        //.background(.cyan)
                    
                        .scrollContentBackground(.hidden)
                    .navigationTitle("Books")
                }
            }
           
            .tabItem {
                Label("Books", systemImage: "book.closed.fill")
            }
            VStack{
                AddBookView(books : books)
                   
            }.tabItem {
                Label("Add Book", systemImage: "plus.app.fill")
            }
        }
        
    }
}

struct MainAppView1_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
