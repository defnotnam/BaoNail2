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
    ///  -typeL The type fo object we expect to get back
    ///  -completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: BNRequest,
        expecting type: T.Type,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        
    }
}
