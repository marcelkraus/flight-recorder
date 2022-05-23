import SwiftUI

enum OnboardingState: Int {
    case initial      // = Start of app
    case intro        // = Introduction confirmed
    case pilot        // = Pilot added
    case flyingObject // = Flighing object added
    case location     // = Location access granted (optional)
    case checklist    // = Checklist confirmed

    var description: String? {
        switch self {
        case .initial:
            return nil
        case .intro:
            return "Einleitung gelesen"
        case .pilot:
            return "Ersten Piloten angelegt"
        case .flyingObject:
            return "Erstes Fluggerät angelegt"
        case .location:
            return "Standort freigegeben"
        case .checklist:
            return "Checkliste bestätigt"
        }
    }

    mutating func updateTo(atLeast state: OnboardingState) {
        if self < state {
            self = state
        }
    }

    func isAtLeast(_ state: OnboardingState) -> Bool {
        switch self {
        case .initial:
            return false
        default:
            return state <= self
        }
    }
}

// MARK: - CaseIterable

extension OnboardingState: CaseIterable {
    // Intentionally left blank.
}

// MARK: - Comparable

extension OnboardingState: Comparable {
    static func < (lhs: OnboardingState, rhs: OnboardingState) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
