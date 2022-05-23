import SwiftUI
import CoreData

struct PilotsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Pilot.name, ascending: true)], animation: .default)
    private var pilots: FetchedResults<Pilot>

    var body: some View {
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
    }

    private func addPilot() {
        withAnimation {
            let pilot = Pilot.create(context: viewContext, name: Pilot.placeholders.randomElement()!.name)
            pilot.abbreviation = Pilot.placeholders.randomElement()!.abbreviation

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

struct PilotsView_Previews: PreviewProvider {
    static var previews: some View {
        PilotsView().environment(\.managedObjectContext, PersistenceController.previewInstance.container.viewContext)
    }
}
