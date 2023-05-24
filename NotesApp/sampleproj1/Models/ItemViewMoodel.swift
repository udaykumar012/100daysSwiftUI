//
//  AddItemViewMoodel.swift
//  sampleproj1
//
//  Created by Uday Kumar Kotla on 11/05/23.
//

import Foundation

class ItemViewModel : ObservableObject{
    @Published var itemList : [String] = []
    init(){
      // itemList=["a","bC"]
    }
    
    func add(_ item : String){
        if(!item.isEmpty){
            self.itemList.append(item)
            //self.objectWillChange.send() //IF @PUBLISHED NOT USED THEN TO RELOAD VIEW WE USE THIS INBUILT METHOD
        }
        print(itemList)
    }
//    func removelast(){
//        if(!self.itemList.isEmpty){
//            self.itemList.removeLast()
//            //self.objectWillChange.send()
//        }
//        print(itemList)
//    }
}
