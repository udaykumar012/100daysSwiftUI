//
//  BookView.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 28/05/23.
//

import SwiftUI



struct BookView: View {
    
    @Binding var book : Book
    var body: some View {
        VStack(alignment: .trailing){
            HStack(alignment:.center,spacing: 10){
                Image(systemName: "book.circle.fill").resizable().scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.white)
                    .background(.blue)
                    .border(Color.blue)
                Spacer()
                VStack(alignment: .leading){
                    Text(book.title).fontWeight(.heavy).foregroundColor(.red)
                    Text(book.author).bold()
                    Text(book.country)
                    //Link("See Book Image", destination: URL(string: book.link)!)
                    
                }.padding()
                Spacer()
            }
           
            
        }
        
        .padding()
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: .constant(noBookItem))
    }
}
