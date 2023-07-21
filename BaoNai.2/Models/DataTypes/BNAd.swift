//
//  BNAd.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import Foundation

struct BNAd: Codable {
    
    struct Welcome: Codable {
        var status: String
        var urgentAdsHTML, data: [Datum]
    }

    // MARK: - Datum
    struct Datum: Codable {
        var aid, bname, bcity: String
        var bstate: Bstate
        var distance: String
        var cangap: String?
        var vip: Int
        var photo: [String: String]?
        var adsTitle, adsMsg: String

        enum CodingKeys: String, CodingKey {
            case aid, bname, bcity, bstate, distance, cangap, vip, photo
            case adsTitle
            case adsMsg
        }
    }

    enum Bstate: String, Codable {
        case tx = "TX"
        case ca = "CA"
        case unknown = "Unknown"
    }
}
