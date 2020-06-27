//
//  ClientAPI.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation

struct ClientAPI {
    
    // dummy apiKey
    static var apiKey = "93fbede77aa1c2ccef9986ec04175542"
    
    enum Endpoints {

        static private let baseURL = "http://10.0.0.3:8080/"
        static private let apiKeyParam = "?api_key=\(ClientAPI.apiKey)"

        case searchBrand(String)
        
        var stringValue: String {
            switch self {
            case .searchBrand(let query):
                return ClientAPI.Endpoints.baseURL + "/search/brand" + Endpoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
}
