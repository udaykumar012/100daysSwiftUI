//
//  DataController.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "BookWorm") //xcdatamodeld name
    
    init(){
        container.loadPersistentStores { description, error in
            if let err = error {
                print("unable to load datamodel : \(err.localizedDescription)")
            }
        }
    }
    
}
