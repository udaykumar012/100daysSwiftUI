//
//  DataController.swift
//  iCalories
//
//  Created by Uday Kumar Kotla on 14/07/23.
//

import Foundation

import CoreData

class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "FoodModel")
    
    init(){
        container.loadPersistentStores { description, error in
            if let err = error {
                print("Failed to load the data \(err.localizedDescription)")
            }
        }
    }
    
    
    //saving data
    func save(context:NSManagedObjectContext){
        //do catch
        do{
            try context.save()
            print("Data saved!!")
        }
        catch{
            print("failed to save data!!")
        }
    }
    
    func addFood(name:String , calories:Double , context:NSManagedObjectContext){
        let food = Food(context: context)
        food.id=UUID()
        food.name=name
        food.calories=calories
        food.date=Date()
        
        save(context: context)
    }
    
    func editFood(food:Food,name:String , calories:Double , context:NSManagedObjectContext){
        food.date = Date()
        food.name=name
        food.calories=calories
        
        save(context: context)
    }
}
