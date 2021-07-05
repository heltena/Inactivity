//
//  InactivityWatcherView.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import SwiftUI

public struct InactivityWatcherView<InactiveView, ActiveView>: View where InactiveView: View, ActiveView: View {
    private var proxy: InactivityWatcherProxy
    private var inactiveView: InactiveView
    private var activeView: ActiveView

    @State private var state: InactivityState = .inactive

    public init(@ViewBuilder content: (InactivityWatcherProxy) -> TupleView<(InactiveView, ActiveView)>) {
        proxy = InactivityWatcherProxy()
        (inactiveView, activeView) = content(proxy).value
    }
    
    public var body: some View {
        Group {
            switch state {
            case .inactive: inactiveView
            case .active: activeView
            }
        }
        .onReceive(InactivityWatcher.shared.$stateChanged) { newState in
            withAnimation {
                self.state = newState
            }
        }
    }
}

struct InactivityWatcherView_Previews: PreviewProvider {
    static var previews: some View {
        InactivityWatcherView { proxy in
            Button {
                proxy.becomeActive(timeout: 5)
            } label: {
                Text("Become Active!")
            }
            .transition(.opacity)
            
            Text("Active")
                .transition(.opacity)
        }
    }
}
