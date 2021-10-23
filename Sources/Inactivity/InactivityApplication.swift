//
//  InactivityApplication.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/3/21.
//

import UIKit

extension UIApplication {

    @objc dynamic func newSendEvent(_ event: UIEvent) {
        newSendEvent(event)
        InactivityWatcher.shared.sendEvent()
    }

}
