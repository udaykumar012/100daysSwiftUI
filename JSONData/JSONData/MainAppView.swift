//
//  ListView1.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import SwiftUI

struct MainAppView: View {
    @State var books : [Book]=[]
    @State var isSelectedBook = false
    @State var selectedBook : Book = noBookItem
    var body: some View {
        VStack(spacing: 0){
            if(isSelectedBook){
                VStack{
                    Text("You selected book")
                        .font(.title)
                        .bold()
                    BookView(book: $selectedBook)
                }.background(Color(red: 0.9, green: 0.9, blue: 0.9))
            }
            NavigationStack{
                List{
                    ForEach($books,id: \.id){ $book in
                        Section{
                            BookView(book: $book)
                                .onTapGesture(count:2){
                                    selectedBook = book
                                    isSelectedBook = true
                                    print(selectedBook.author)
                                    
                                    
                                }
                                .listRowBackground(Color(red: 0.9, green: 0.9, blue: 0.9))
                            
                            Link(destination: URL(string: book.imageLink)!) {
                                Text("Image Link")
                                    .foregroundColor(.blue)
                            }
                            .listRowBackground(Color.yellow)
                            
                        }
                    header: {
                            Text("Book id : \(book.id)").fontWeight(.heavy)
                        }
                        
                        
                    }
                    .onDelete(){
                        index in
                        books.remove(atOffsets: index)
                    }
                    
                }.onAppear(){
                    Api().loadData(completion:{
                        books in
                        self.books = books
                    }
                    )
                }.listStyle(.sidebar)
                    .background(.cyan)
                
                    .scrollContentBackground(.hidden)
                .navigationTitle("Books")
            }
        }
        
    }
}

struct MainAppView1_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
