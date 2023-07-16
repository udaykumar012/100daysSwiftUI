//
//  iCaloriesApp.swift
//  iCalories
//
//  Created by Uday Kumar Kotla on 14/07/23.
//

import SwiftUI

@main
struct iCaloriesApp: App {
    //inject db
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
