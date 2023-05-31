//
//  BookModel.swift
//  JSONData
//
//  Created by Uday Kumar Kotla on 31/05/23.
//

import Foundation

class BookModel : ObservableObject{
    @Published var allBooks : [Book] = []
    init(){
        //allBooks = [noBookItem]
    }
}
