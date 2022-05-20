import SwiftUI

struct PilotView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @Binding var state: OnboardingState

    @FetchRequest(sortDescriptors: []) private var pilots: FetchedResults<Pilot>

    @State private var name: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text("Wer bist du?")
                .font(.title)
            Text("Lege nun deinen ersten Piloten an. Dieser Pilot wird der Standard-Pilot deiner Fluggeräte.")
                .font(.body)
            HStack(alignment: .center, spacing: 16.0) {
                TextField("Name deines ersten Piloten", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .disabled(atLeastOnePilotIsAvailable)
                Button(action: addPilot) {
                    Image(systemName: atLeastOnePilotIsAvailable ? "checkmark.circle" : "plus.circle")
                        .imageScale(.large)
                }
                .disabled(nameIsValid || atLeastOnePilotIsAvailable)
            }
            Text("Natürlich kannst du deinen Piloten später anpassen und weitere Piloten anlegen.")
            Spacer()
            VStack(spacing: -4.0) {
                OnboardingStateView(state: $state)
                HStack(spacing: 0.0) {
                    Spacer()
                    NavigationLink(destination: {
                        FlightObjectView(state: $state)
                    }, label: {
                        Image(systemName: "arrow.forward.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48.0, height: 48.0, alignment: .center)
                            .imageScale(.large)
                            .foregroundColor(Color.accentColor)
                            .background(Color.white)
                    })
                    .disabled(atLeastOnePilotIsAvailable == false)
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Erstelle deinen Piloten")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func addPilot() {
        let pilot = Pilot(context: viewContext)
        pilot.id = UUID()
        pilot.isDefault = true
        pilot.name = name

        do {
            try viewContext.save()
            state.updateTo(atLeast: .pilot)
        } catch {
            // TODO: Add error handling
        }
    }

    private var nameIsValid: Bool {
        name.count == 0
    }

    private var atLeastOnePilotIsAvailable: Bool {
        pilots.count > 0
    }
}

struct PilotView_Previews: PreviewProvider {
    static var previews: some View {
        PilotView(state: .constant(.intro))
    }
}
