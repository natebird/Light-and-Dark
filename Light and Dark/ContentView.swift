//
//  ContentView.swift
//  Light and Dark
//
//  Created by Nate Bird on 7/25/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentColorScheme") var currentColorScheme: ColorSchemeOption = .none
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text(String(localized: "Appearance", comment: "Section heading"))) {
                    Picker("Color Scheme", selection: $currentColorScheme) {
                        ForEach(ColorSchemeOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                .navigationTitle(String(localized: "App Theme", comment: "Screen Title"))
                Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")

            }
        }
    }
}

#Preview {
    @Previewable @AppStorage("currentColorScheme") var colorScheme: ColorSchemeOption = .none
    ContentView()
        .preferredColorScheme(colorScheme.toColorScheme())
}
