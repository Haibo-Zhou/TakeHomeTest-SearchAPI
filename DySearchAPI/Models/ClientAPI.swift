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
        
        // GCDWebServer will create serverURL as IP address according to connection type (wifi or 3g/4g) and platform (simulator on Macbook or real iPhone) for DNS name.
        // e.g. with DNS name on iPhone - "http://iPhone.local:8080", with simulator on Macbook Air - "http://MacbookAir.local:8080)."
        // Solution is to bind serverURL to "localhost" regardless of connection type. That means no network connection is required now.
        static private let baseURL = GCDServer.serverURL.absoluteString
        static private let apiKeyParam = "?api_key=\(ClientAPI.apiKey)"

        case searchBrand(String, Int)
        
        var stringValue: String {
            switch self {
            case .searchBrand(let query, let page):
                return ClientAPI.Endpoints.baseURL + "search/brand" + Endpoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=\(page)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
}
