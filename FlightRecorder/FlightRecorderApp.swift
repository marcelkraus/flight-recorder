//
//  FlightRecorderApp.swift
//  FlightRecorder
//
//  Created by Marcel Kraus on 18.05.22.
//

import SwiftUI

@main
struct FlightRecorderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
