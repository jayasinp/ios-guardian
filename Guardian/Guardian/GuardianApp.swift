//
//  GuardianApp.swift
//  Guardian
//
//  Created by Pravin Jayasinghe on 20/9/2024.
//

import SwiftUI

@main
struct GuardianApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
