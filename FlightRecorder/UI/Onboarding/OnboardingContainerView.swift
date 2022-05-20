import SwiftUI

struct OnboardingContainerView: View {
    @State var state = OnboardingState.initial

    var body: some View {
        NavigationView {
            IntroView(state: $state)
        }
        .navigationViewStyle(.stack)
    }
}
