import SwiftUI

struct OnboardingContainerView: View {
    var body: some View {
        NavigationView {
            IntroView()
        }
        .navigationViewStyle(.stack)
    }
}
