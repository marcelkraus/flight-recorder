import CoreData

extension Pilot {
    static let placeholders = [
        (name: "Amelia Mary Earhart", abbreviation: "EAR", isDefault: false),
        (name: "Han Solo", abbreviation: "HAN", isDefault: true),
        (name: "Chesley B. Sullenberger", abbreviation: "SUL", isDefault: false)
    ]

    static func create(context: NSManagedObjectContext, name: String, isDefault: Bool = false) -> Self {
        let pilot = Self(context: context)
        pilot.id = UUID()
        pilot.isDefault = isDefault
        pilot.name = name

        return pilot
    }
}
