//
//  BNAPICacheManager.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/20/23.
//
import Foundation

/// Manages in memory session scoped API caches
final class BNAPICacheManager {
    // API URL: Data

    /// Cache map
    private var cacheDictionary: [
        BNEndpoint: NSCache<NSString, NSData>
    ] = [:]

    /// Constructor
    init() {
        setUpCache()
    }

    // MARK: - Public

    /// Get cached API response
    /// - Parameters:
    ///   - endpoint: Endpoiint to cahce for
    ///   - url: Url key
    /// - Returns: Nullable data
    public func cachedResponse(for endpoint: BNEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }

    /// Set API response cache
    /// - Parameters:
    ///   - endpoint: Endpoint to cache for
    ///   - url: Url string
    ///   - data: Data to set in cache
    public func setCache(for endpoint: BNEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }

    // MARK: - Private

    /// Set up dictionary
    private func setUpCache() {
        BNEndpoint.allCases.forEach({ endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
}
