//
//  ViewController.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/25/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

// Removed as switch to SwiftUI from UIKit.

//import UIKit
//
//class BrandViewController: UIViewController {
//    let mockServer = GCDServer()
//    let tableView = UITableView()
//    private let products = ProductAPI.loadProducts()
//    let searchController = UISearchController(searchResultsController: nil)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Search Bar config
////        setupSearchBarListeners()
//        navigationItem.searchController = searchController
//        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.title = "Search"
//        
//        view.backgroundColor = .white
//        
//        tableView.register(ProductCell.self, forCellReuseIdentifier: "productCell")
//        tableView.dataSource = self
//        tableView.delegate = self
//        view.addSubview(tableView)
//        
//        // Start GCDWebServer
//        mockServer.initWebServer()
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        mockServer.stopWebServer()
//    }
//}
//
//extension BrandViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return products.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCell
//        cell.brandLabel.text = products[indexPath.row].brandName
////        cell.stockLabel.text = products[indexPath.row].inStock ? "In-stock" : "Out-of-stock"
////        cell.priceLabel.text = String(products[indexPath.row].price)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "AAA"
//    }
//    
//}
//
//extension BrandViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
////    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
////        <#code#>
////    }
//}


