//
//  BNGetAllAdsResponse.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/20/23.
//

import Foundation

struct BNGetAllAdsResponse : Codable {
    struct Info: Codable {
        let next:  String? // https://baonail.com/index.php?state=TX&page=2#page2 and so on
        let prev: String? // same thing as above just subtract one from the last bumber and things
    }
    
    let data: [BNAd]
}
