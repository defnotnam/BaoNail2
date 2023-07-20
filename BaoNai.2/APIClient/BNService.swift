//
//  BNService.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import Foundation

/// Primary API service object to get Ad data
final class BNService {
    /// Shared singleton instance
    static let shared = BNService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Ad API Call
    /// -Parameters:
    ///  -request: Request instance
    ///  -completion: Callback with data or error
    public func execute(_ request: BNRequest, completion: @escaping () -> Void) {
        
    }
}
