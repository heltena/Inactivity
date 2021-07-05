//
//  InactivityApplication.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/3/21.
//

import UIKit

public class InactivityApplication: UIApplication {
    public let watcher = InactivityWatcher()
    
    public static override var shared: InactivityApplication {
        UIApplication.shared as! InactivityApplication
    }
    
    public override func sendEvent(_ event: UIEvent) {
        watcher.sendEvent()
        super.sendEvent(event)
    }
}
