import SwiftUI

struct IntroView: View {
    @Binding var state: OnboardingState

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text("Hallo, Flieger!")
                .font(.title)
            Text("Dies ist dein persönliches **Flugbuch**.\n\nErfasse alle deine Drohnenflüge in dieser App und sei für alle behördlichen Auflagen bestens gerüstet.\n\nIn den nächsten fünf Schritten werde ich dich durch die Ersteinrichtung der App führen.")
                .font(.body)
            Spacer()
            VStack(spacing: -4.0) {
                OnboardingStateView(state: $state)
                HStack(spacing: 0.0) {
                    Spacer()
                    NavigationLink(destination: {
                        PilotView(state: $state)
                    }, label: {
                        Image(systemName: "arrow.forward.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48.0, height: 48.0, alignment: .center)
                            .imageScale(.large)
                            .foregroundColor(Color.accentColor)
                            .background(Color.white)
                    })
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Herzlich Willkommen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(state: .constant(.initial))
    }
}
