import SwiftUI

struct PilotView: View {
    @Binding var state: OnboardingState

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text("Wer bist du?")
                .font(.title)
            Text("Lege nun deinen ersten Piloten an. Dieser Pilot wird der Standardpilot deiner Fluggeräte. Natürlich kannst du später weitere Piloten anlegen.")
                .font(.body)
            Spacer()
            VStack(spacing: -4.0) {
                OnboardingStateView(state: $state)
                HStack(spacing: 0.0) {
                    Spacer()
                    NavigationLink(destination: {
                        // TODO: Add next view.
                    }, label: {
                        Image(systemName: "arrow.forward.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48.0, height: 48.0, alignment: .center)
                            .imageScale(.large)
                            .foregroundColor(Color.accentColor)
                            .background(Color.white)
                    })
                    .disabled(true)
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Erstelle deinen Piloten")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            state = .intro
        }
    }
}

struct PilotView_Previews: PreviewProvider {
    static var previews: some View {
        PilotView(state: .constant(.intro))
    }
}
