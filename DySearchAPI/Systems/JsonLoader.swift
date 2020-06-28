//
//  JsonLoader.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation

class JsonLoader {
    
    private func loadFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                print("hahah: ",jsonData )
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func jsonStrToDict(forName name: String) -> [String: Any]? {
        if let jsonData = loadFile(forName: name) {
            do {
                if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    print(jsonDict)
                    return jsonDict
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    
}
