//
//  ViewController.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/25/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mockServer = GCDServer()

    override func viewDidLoad() {
        super.viewDidLoad()
        mockServer.initWebServer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mockServer.stopWebServer()
    }
    
    
    
    

}

