//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Uday Kumar Kotla on 08/07/23.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
