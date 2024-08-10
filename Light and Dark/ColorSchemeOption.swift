import SwiftUI

enum ColorSchemeOption: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case none = "System"
    
    var id: String { rawValue }
    
    func toColorScheme() -> ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .none:
            return .none
        }
    }
}
