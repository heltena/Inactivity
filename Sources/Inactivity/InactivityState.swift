//
//  InactivityState.swift
//  Inactivity
//
//  Created by Helio Tejedor on 7/5/21.
//

import Foundation

public enum InactivityState: String {
    case active
    case inactive
}

extension InactivityState: Identifiable {
    public var id: String { rawValue }
}
