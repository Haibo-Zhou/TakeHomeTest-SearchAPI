//
//  StartServer.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation
import GCDWebServer

class GCDServer {
    
    lazy var webServer = GCDWebServer()
    
    func initWebServer() {
        
        let path = "/search/brand"
        webServer.addHandler(forMethod: "GET", path: path, request: GCDWebServerRequest.self, processBlock: { request in
            print("WebServer - GET detected")
            return GCDWebServerDataResponse(jsonObject: JsonLoader().jsonStrToDict() ?? [])
        })
        
        webServer.start(withPort: 8080, bonjourName: "My Test Site")
        
        DispatchQueue.main.async {
            if let serverURL = self.webServer.serverURL {
                print("VISIT \(serverURL) in your web browser")
            } else {
                print("Not connected!")
            }
        }
    }
    
    func stopWebServer() {
        webServer.stop()
    }
}