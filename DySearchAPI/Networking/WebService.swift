//
//  WebService.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation
import Combine

struct WebService {
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.waitsForConnectivity = true
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }()
    
    private func createPublisher<T: Codable>(for url: URL) -> AnyPublisher<T, FailureReason> {
        return session.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let httpURLResponse = output.response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200 else {
                        throw HTTPError.statusCode
                }
                return output.data
        }
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            switch error {
            case is Swift.DecodingError:
                return .decodingFailed
            case let httpError as HTTPError:
                return .sessionFailed(error: httpError)
            default:
                return .other(error)
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getBrandSearchResultsPublisher(for name: String) -> AnyPublisher<[Product], FailureReason> {
        createPublisher(for: ClientAPI.Endpoints.searchBrand(name).url)
    }
}
