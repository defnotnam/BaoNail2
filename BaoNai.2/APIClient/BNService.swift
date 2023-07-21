//
//  BNService.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/19/23.
//
import Foundation

/// Primary API service object to get Rick and Morty data
final class BNService {
    /// Shared singleton instance
    static let shared = BNService()

    private let cacheManager = BNAPICacheManager()

    /// Privatized constructor
    private init() {}

    /// Error types
    enum BNServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }

    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: BNRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        if let cachedData = cacheManager.cachedResponse(
            for: request.endpoint,
            url: request.url
        ) {
            do {
                let result = try JSONDecoder().decode(type.self, from: cachedData)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
            return
        }

        guard let urlRequest = self.request(from: request) else {
            completion(.failure(BNServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? BNServiceError.failedToGetData))
                return
            }

            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                self?.cacheManager.setCache(
                    for: request.endpoint,
                    url: request.url,
                    data: data
                )
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    // MARK: - Private

    private func request(from bnRequest: BNRequest) -> URLRequest? {
        guard let url = bnRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = bnRequest.httpMethod
        return request
    }
}
