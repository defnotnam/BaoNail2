//
//  BNEndpoint.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import Foundation

/// Represents unique API endpoint
@frozen enum BNEndpoint: String, CaseIterable, Hashable {
    ///Endpint to get ad info
    case ads = "index_api.php?zipcode=78745&api_key=jfu48dHgdn89" // "ads"
    case location
}
