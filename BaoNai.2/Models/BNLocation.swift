//
//  BNLocation.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import Foundation

enum WelcomeElement: Codable {
    case string(String)
    case welcomeClass(WelcomeClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(WelcomeClass.self) {
            self = .welcomeClass(x)
            return
        }
        throw DecodingError.typeMismatch(WelcomeElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for WelcomeElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .welcomeClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - WelcomeClass
struct WelcomeClass: Codable {
    var city: String
    var state: State
    var zipcode, kw: String
}

enum State: String, Codable {
    case tx = "TX"
}

typealias Welcome = [WelcomeElement]
