import SwiftUI

@main
struct FlightRecorderApp: App {
    let persistenceController = PersistenceController.sharedInstance

    var body: some Scene {
        WindowGroup {
            PilotView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
