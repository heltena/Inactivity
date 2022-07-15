//
//  InactivityTriggerType.swift
//  
//
//  Created by Randy Speakman on 7/15/22.
//

import Foundation


/**
 Enum that represents the type of inactivity trigger
 
 Inactivity can be triggered by specific manual events like button clicks. It can also be handled automatically by any user interaction with the system like a random tap on the screen
 */
public enum InactivityTriggerType: String {
    // Triggered by button actions etc
    case manual
    //Triggered by any interaction
    case automatic
}

extension InactivityTriggerType: Identifiable {
    public var id: String { rawValue }
}
