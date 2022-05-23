import CoreLocation
import SwiftUI

struct LocationView: View {
    @Binding var state: OnboardingState

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            Text("Wo fliegst du?")
                .font(.title)
            Text("Nun benötigt diese App Zugriff auf deinen Standort. Dies ist nicht erforderlich, erleichtert aber das Erfassen deiner Flüge.")
                .font(.body)
            HStack {
                Spacer()
                Button(action: {
                    // TODO: Add location request
                }, label: {
                    Label {
                        Text("Standort freigeben")
                    } icon: {
                        Image(systemName: "location.circle")
                    }
                })
                .padding(EdgeInsets.init(top: 8.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
                .overlay(RoundedRectangle(cornerRadius: 28.0).stroke(Color.accentColor, lineWidth: 1))
                Spacer()
            }
            Spacer()
            VStack(spacing: -8.0) {
                OnboardingStateView(state: $state)
                HStack(spacing: 0.0) {
                    Spacer()
                    NavigationLink(destination: {
                        PilotView(state: $state)
                            .onAppear {
                                state.updateTo(atLeast: .intro)
                            }
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
        .navigationTitle("Dein Standort")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(state: .constant(.flyingObject))
    }
}
