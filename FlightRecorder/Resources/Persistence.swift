import CoreData

struct PersistenceController {
    static let defaultPilots = [
        ("Amelia Mary Earhart", "EAR", false),
        ("Han Solo", "HAN", true),
        ("Chesley B. Sullenberger", "SUL", false)
    ]

    // TODO: Remove `inMemory` flag after developing the onboarding flow.
    static let sharedInstance = PersistenceController(inMemory: true)

    static var previewInstance: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        Self.defaultPilots.forEach {
            let pilot = Pilot(context: viewContext)
            pilot.id = UUID()
            pilot.name = $0.0
            pilot.abbreviation = $0.1
            pilot.isDefault = $0.2
        }

        try? viewContext.save()

        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "FlightRecorder")

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
