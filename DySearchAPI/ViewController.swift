//
//  ViewController.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/25/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import UIKit
import GCDWebServer

class ViewController: UIViewController {
    
    lazy var webServer = GCDWebServer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initWebServer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopWebServer()
    }
    
    func initWebServer() {
        
        let jsonData = NSData(contentsOfFile: "mock-data.json")
        var jsonDict = [String: Any]()
        
        let str = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
        let data = Data(str.utf8)

        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // try to read out a string array
                jsonDict = json
                
                if let names = json["names"] as? [String] {
                    print("HAIBO: ", names)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
//        do {
//            if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
//                if let brandName = jsonDict["brand_name"] as? [String] {
//                    print(brandName)
//                }
//            }
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//        }
        
        let path = "/search/brand"
        webServer.addHandler(forMethod: "GET", path: path, request: GCDWebServerRequest.self, processBlock: { request in
            print("WebServer - GET detected")
            return GCDWebServerDataResponse(jsonObject: jsonDict)
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

