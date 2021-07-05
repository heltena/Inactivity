//
//  InactivityWatcher.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import Combine
import Foundation

public class InactivityWatcher: ObservableObject {
    @Published public private(set) var stateChanged: InactivityState = .inactive

    private var timer: AnyCancellable?
    private var lastTimeout: TimeInterval?

    #if DEBUG
    static let debug = InactivityWatcher()
    #endif
    
    static var shared: InactivityWatcher {
        #if DEBUG
        InactivityWatcher.debug
        #else
            InactivityApplication.shared.watcher
        #endif
    }
    
    public func startWatch(timeout: TimeInterval) {
        timer?.cancel()
        if self.stateChanged != .active {
            self.stateChanged = .active
        }
        self.lastTimeout = timeout
        timer = Timer.publish(every: timeout, on: .main, in: .default)
            .autoconnect()
            .sink { _ in
                if self.stateChanged != .inactive {
                    self.stateChanged = .inactive
                }
                self.lastTimeout = nil
                self.timer?.cancel()
            }
    }

    public func sendEvent() {
        if self.stateChanged == .active, let lastTimeout = self.lastTimeout {
            startWatch(timeout: lastTimeout)
        }
    }
}

