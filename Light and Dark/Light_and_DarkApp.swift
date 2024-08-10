//
//  Light_and_DarkApp.swift
//  Light and Dark
//
//  Created by Nate Bird on 7/25/24.
//

import SwiftUI

@main
struct Light_and_DarkApp: App {
    @AppStorage("currentColorScheme") var currentColorScheme = ColorSchemeOption.none
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(currentColorScheme.toColorScheme())
        }
    }
}
