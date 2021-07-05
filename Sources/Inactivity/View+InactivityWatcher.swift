//
//  View+InactivityWatcher.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import SwiftUI

extension View {
    public func onInactivityStateChanged(_ perform: @escaping (InactivityState) -> Void) -> some View {
        self.onReceive(InactivityApplication.shared.watcher.$stateChanged, perform: perform)
    }
}
