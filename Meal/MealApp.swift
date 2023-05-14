//
//  MealApp.swift
//  Meal
//
//  Created by Mahesh sai on 5/13/23.
//

import SwiftUI

@main
struct MealApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
