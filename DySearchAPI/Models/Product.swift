//
//  Product.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import Foundation

struct Product: Codable {
    let brandName: String?
    let productName: String?
    let productCategory: String?
    let inStock: Bool
    let price: Float
    let id: Int?
}
