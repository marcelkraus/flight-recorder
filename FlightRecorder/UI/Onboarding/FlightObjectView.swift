import SwiftUI

struct FlightObjectView: View {
    @Binding var state: OnboardingState

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text("Was fliegst du?")
                .font(.title)
            Text("Nun ist dein Fluggerät dran. Lege deine erstes an, dieses wird das Standard-Fluggerät deiner Flotte.")
                .font(.body)
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
                    .disabled(true)
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Erstelle dein Fluggerät")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FlightObjectView_Previews: PreviewProvider {
    static var previews: some View {
        FlightObjectView(state: .constant(.intro))
    }
}
