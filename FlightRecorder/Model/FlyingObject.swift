import CoreData

extension FlyingObject {
    static func create(context: NSManagedObjectContext, name: String) -> Self {
        let flyingObject = Self(context: context)
        flyingObject.id = UUID()
        flyingObject.name = name

        return flyingObject
    }
}
