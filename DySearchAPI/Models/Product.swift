//
//  Product.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI


struct ProductsResult: Codable {
    let page: Int
    let totalPages: Int
    let results: [Product]
}

struct Product: Codable {
    let brandName: String?
    let productName: String?
    let productCategory: String?
    let inStock: Bool?
    let price: CGFloat?
    let id: Int?
}
