//
//  ClientAPI.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI

struct ClientAPI {
    
    // dummy apiKey, should set it as encoded, e.g. store it in plist file.
    static var apiKey = "93fbede77aa1c2ccef9986ec04175542"
    
    enum Endpoints {

        static private let baseURL = "http://iPhone.local:8080"
        static private let apiKeyParam = "?api_key=\(ClientAPI.apiKey)"

        case searchBrand(String, Int)
        
        var stringValue: String {
            switch self {
            case .searchBrand(let query, let page):
                return ClientAPI.Endpoints.baseURL + "/search/brand" + Endpoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=\(page)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
}
