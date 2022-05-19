import SwiftUI
import CoreData

struct PilotView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Pilot.name, ascending: true)], animation: .default)
    private var pilots: FetchedResults<Pilot>

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(pilots) { pilot in
                        NavigationLink {
                            Text(pilot.name!)
                        } label: {
                            HStack {
                                Image(systemName: pilot.isDefault ? "circle.fill" : "circle")
                                Text(pilot.name!)
                            }
                        }
                    }
                    .onDelete(perform: deletePilots)
                } footer: {
                    Text("Der mit einem \(Image(systemName: "circle.fill")) markierte Pilot ist dein **Standardpilot**. Dieser kann nicht gelöscht werden.")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Piloten")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: addPilot) {
                        Label("Add Pilot", systemImage: "plus")
                    }
                    EditButton()
                }
            }
            Text("Select a pilot")
        }
    }

    private func addPilot() {
        withAnimation {
            let pilot = Pilot(context: viewContext)
            pilot.name = PersistenceController.defaultPilots.randomElement()!.0
            pilot.abbreviation = PersistenceController.defaultPilots.randomElement()!.1

            try? viewContext.save()
        }
    }

    private func deletePilots(offsets: IndexSet) {
        withAnimation {
            offsets.map { pilots[$0] }.forEach(viewContext.delete)

            try? viewContext.save()
        }
    }
}

struct PilotView_Previews: PreviewProvider {
    static var previews: some View {
        PilotView().environment(\.managedObjectContext, PersistenceController.previewInstance.container.viewContext)
    }
}
