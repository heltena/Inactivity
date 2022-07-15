//
//  InactivityWatcher.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import Combine
import Foundation
import UIKit

public class InactivityWatcher: ObservableObject {
    @Published public private(set) var stateChanged: InactivityState = .inactive

    private var timer: AnyCancellable?
    private var lastTimeout: TimeInterval?
    private var triggerType: InactivityTriggerType = .manual
    public static let shared = InactivityWatcher()

    private init() {
        let uiAppClass = UIApplication.self
        let currentSendEvent = class_getInstanceMethod(uiAppClass, #selector(uiAppClass.sendEvent))
        let newSendEvent = class_getInstanceMethod(uiAppClass, #selector(uiAppClass.newSendEvent))
        method_exchangeImplementations(currentSendEvent!, newSendEvent!)
        print("sendEvent Swizzled")
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
                self.inactivate()
            }
    }

    public func inactivate() {
        if self.stateChanged != .inactive {
            self.stateChanged = .inactive
        }
        self.timer?.cancel()
    }

    public func sendEvent() {
        
        switch stateChanged {
            // Handle case where user is already active when new activity is received by sendEvent
            case .active:
                if let lastTimeout = self.lastTimeout {
                    startWatch(timeout: lastTimeout)
                }
            // Handle case where the user was inactive and new activity has been received by sendEvent.
            case .inactive:
                // It the trigger type is autuomatic, then this means the user is now active and
                // we must change the state from inactive to active
                if triggerType == .automatic {
                        self.stateChanged = .active
                }
         }
    }
    
    /**
     Sets the trigger type
     
     Use this to change the trigger type from the default of .manual
     */
    public static func setTriggerType(triggerType : InactivityTriggerType) {
        self.shared.triggerType = triggerType
    }
}

