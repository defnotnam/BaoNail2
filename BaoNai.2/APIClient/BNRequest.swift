//
//  BNRequest.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//

import Foundation

/// Object that represents a singlet API call
final class BNRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://baonail.com"
    }

    /// Desired endpoint
    let endpoint: BNEndpoint

    /// Path components for API, if any
    private let pathComponents: [String]

    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]

    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue

        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }

    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    // MARK: - Public

    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: BNEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }


}
