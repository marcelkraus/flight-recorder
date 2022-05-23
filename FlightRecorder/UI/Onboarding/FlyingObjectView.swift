import SwiftUI

struct FlyingObjectView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @Binding var state: OnboardingState

    @FetchRequest(sortDescriptors: []) private var flyingObjects: FetchedResults<FlyingObject>

    @State private var name: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text("Was fliegst du?")
                .font(.title)
            Text("Als nächstes wähle bitte den Namen deines Fluggerätes. Dieses wird als Standard-Fluggerät verwendet.")
                .font(.body)
            HStack(alignment: .center, spacing: 16.0) {
                TextField("Name deines Fluggerätes", text: $name) {
                    add()
                }
                .textFieldStyle(.roundedBorder)
                .disabled(atLeastOneIsAvailable)
                Button(action: add) {
                    Image(systemName: atLeastOneIsAvailable ? "checkmark.circle" : "plus.circle")
                        .imageScale(.large)
                }
                .disabled(nameIsValid || atLeastOneIsAvailable)
            }
            Text("Natürlich kannst du auch deine Flugobjekte später noch anpassen.")
            Spacer()
            VStack(spacing: -4.0) {
                OnboardingStateView(state: $state)
                HStack(spacing: 0.0) {
                    Spacer()
                    NavigationLink(destination: {
                        LocationView(state: $state)
                    }, label: {
                        Image(systemName: "arrow.forward.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48.0, height: 48.0, alignment: .center)
                            .imageScale(.large)
                            .foregroundColor(Color.accentColor)
                            .background(Color.white)
                    })
                    .disabled(atLeastOneIsAvailable == false)
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Dein Fluggerät")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func add() {
        let flyingObject = FlyingObject(context: viewContext)
        flyingObject.id = UUID()
        flyingObject.name = name

        do {
            try viewContext.save()
            state.updateTo(atLeast: .flyingObject)
        } catch {
            // TODO: Add error handling
        }
    }

    private var nameIsValid: Bool {
        name.count == 0
    }

    private var atLeastOneIsAvailable: Bool {
        flyingObjects.count > 0
    }
}

struct FlyingObjectView_Previews: PreviewProvider {
    static var previews: some View {
        FlyingObjectView(state: .constant(.pilot))
    }
}
