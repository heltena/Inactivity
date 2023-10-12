//
//  InactivityApplication.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/3/21.
//

#if os(iOS)
import UIKit
fileprivate typealias Application = UIApplication
typealias Event = UIEvent
#endif

#if os(macOS)
import AppKit
fileprivate typealias Application = NSApplication
typealias Event = NSEvent
#endif

extension Application {

    @objc dynamic func newSendEvent(_ event: Event) {
        newSendEvent(event)
        InactivityWatcher.shared.sendEvent()
    }

}
