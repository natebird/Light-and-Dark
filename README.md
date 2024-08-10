# Light and Dark

This is an example application showing how I think I should be able to set Light and Dark modes using the SwiftUI `.preferredColorScheme` option. It works in most scenarios. The issue with this implementation is it will not revert back to the "System" setting once "Light" or "Dark" has been selected. It will remain with the last selected mode. A user can workaround this failure by selecting the "System" option and then quiting and relaunching the app. I am not sure if this is a problem with the implementation or a bug in how `.preferredColorScheme` works.

**Relevant Apple Documentation**
* [`.colorscheme`](https://developer.apple.com/documentation/swiftui/colorscheme) - The documentation lists `.light` and `.dark` values
* [`.preferredColorScheme`](https://developer.apple.com/documentation/swiftui/view/preferredcolorscheme(_:)) - The documentation lists `.light` and `.dark` values but you can also pass `.none` and `nil`. However, I'm not sure that these values (`.none` and `nil`) do anything and that may be the cause of the failing scenarios.

## Working Scenarios
* App setting defaults to 'System' (`colorScheme = .none`). Changing to Light or Dark mode using Control Center widget will change the app to the respective `colorScheme` of Light or Dark.
* Change the app setting to "Light" (`colorScheme = .light`). The app will remain in Light mode regardless of the System setting.
* Change the app setting to "Dark" (`colorScheme = .dark`). The app will remain in Dark mode regardless of the System setting.

## Failing Scenarios
* Change the app setting to "Light". Change the app setting to "System" (`.none`). The `preferedColorScheme` value will remain in "Light" mode regardless of the System setting. The expectation is that the app colorScheme should change to the System setting when the app setting is set to `.none`.
* Change the app setting to "Dark". Change the app setting to "System" (`.none`). The `preferedColorScheme` value will remain in "Dark" mode regardless of the System setting. The expectation is that the app colorScheme should change to the System setting when the app setting is set to `.none`.

**Note:** If the app is forced quit and relaunched, the system setting will be correctly applied again.
