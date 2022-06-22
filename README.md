# Inactivity

I needed to detect idle mode on a SwiftUI app for a kiosk, so I did it.

## Usage

> **Note:** The `Principal class` is not necessary.

This is an example:

```swift
InactivityWatcherView { proxy in
    InactiveView {
        proxy.becomeActive(timeout: 5)
    }
    .transition(.opacity)
    
    ActiveView()
        .transition(.opacity)
}
```

Also, you can perform an action when the state changes:

```swift
Text("Example")
    .onInactivityStateChanged { state in print("Going to \(state)") }
```

Finally, it is possible to access to the `InactivityWatcher` class using the `shared` attribute of the `InactivityApplication`:

```swift
InactivityApplication.shared.watcher.startWatch(timeout: 120)
```

Find an Xcode app example here: https://github.com/heltena/InactivityExample

Enjoy!
