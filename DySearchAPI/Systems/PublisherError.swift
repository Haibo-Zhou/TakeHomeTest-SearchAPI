//
//  PublisherError.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation

enum HTTPError: LocalizedError {
    case statusCode
    case post
}

enum FailureReason: Error {
    case sessionFailed(error: HTTPError)
    case decodingFailed
    case other(Error)
}
