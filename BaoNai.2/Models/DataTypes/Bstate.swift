//
//  BNState.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/21/23.
//

import Foundation
enum Bstate: String, Codable {
    case tx = "TX"
    case ca = "CA"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .tx, .ca:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
