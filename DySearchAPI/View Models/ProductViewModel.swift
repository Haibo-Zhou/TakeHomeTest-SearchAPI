//
//  ProductViewModel.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI


struct ProductViewModel: Identifiable, Hashable {
    
    var id: Int
    var brandName: String
    var productName: String
    var productCategory: String
    var inStock: String
    var price = ""
    
    static var `default` : ProductViewModel {
        get {
            ProductViewModel(product: Product(brandName: "", productName: "", productCategory: "", inStock: false, price: 0, id: 0))
        }
    }
    
    init(product: Product) {
        self.id = product.id!
        self.brandName = product.brandName ?? "N/A"
        self.productName = product.productName ?? "N/A"
        self.productCategory = product.productCategory ?? "N/A"
        self.inStock = ProductViewModel.getStockState(product: product)
        
        if let price = product.price {
            self.price = "$\(price)"
        }
    }
    
    static private func getStockState(product: Product) -> String {
        if let stockState = product.inStock {
            if stockState == true {
                return "In-stock"
            } else {
                return "Out-of-stock"
            }
        }
        return "N/A"
    }
}
