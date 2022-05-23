import SwiftUI

struct OnboardingStateView: View {
    @Binding var state: OnboardingState

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(OnboardingState.allCases, id: \.self) { state in
                if let description = state.description {
                    HStack(spacing: 8.0) {
                        image(for: state)
                        Text(description)
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 24.0).stroke(Color.gray, lineWidth: 1))
        .font(.body)
    }

    @ViewBuilder
    private func image(for desiredState: OnboardingState) -> some View {
        Image(systemName: state.isAtLeast(desiredState) ? "checkmark.circle" : "circle")
            .foregroundColor(state.isAtLeast(desiredState) ? .green : .gray)
    }
}

struct OnboardingStateView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStateView(state: .constant(.flyingObject))
    }
}
