//
//  InactivityWatcherProxy.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import Foundation

public struct InactivityWatcherProxy {
    public func becomeInactive() {
        InactivityApplication.shared.watcher.inactivate()
    }
    
    public func becomeActive(timeout: TimeInterval) {
        InactivityApplication.shared.watcher.startWatch(timeout: timeout)
    }
}
