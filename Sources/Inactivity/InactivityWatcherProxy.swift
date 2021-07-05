//
//  InactivityWatcherProxy.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import Foundation

public struct InactivityWatcherProxy {
    public func becomeActive(timeout: TimeInterval) {
        InactivityWatcher.shared.startWatch(timeout: timeout)
    }
}
