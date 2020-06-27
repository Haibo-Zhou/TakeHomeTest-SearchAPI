//
//  ViewController.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/25/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {
    let mockServer = GCDServer()
    let tableView = UITableView()
    private let products = ProductAPI.loadProducts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
        
        // Start GCDWebServer
        mockServer.initWebServer()
    }
    
    func setupTableView() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "productCell")
        
        navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mockServer.stopWebServer()
    }
}

extension BrandViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row].brandName
        cell.detailTextLabel?.text = "In-stock"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "AAA"
    }
    
}

extension BrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        <#code#>
//    }
}


