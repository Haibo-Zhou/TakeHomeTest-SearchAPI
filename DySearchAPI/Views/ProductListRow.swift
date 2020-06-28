//
//  ProductListRow.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI

struct ProductListRow: View {
    var product: ProductViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                ProductName(product: product)
                StockState(product: product)
            }
            PriceLabel(product: product)
        }.padding(.vertical)
    }
    
    // MARK: Sub-Component
    struct ProductName: View {
        var product: ProductViewModel
        
        var body: some View {
            Text(product.productName)
                .font(.headline)
        }
    }
    
    struct StockState: View {
        var product: ProductViewModel
        
        var body: some View {
            Text(product.inStock)
                .font(.subheadline)
        }
    }
    
    struct PriceLabel: View {
        var product: ProductViewModel
        
        var body: some View {
            Text(String(product.price))
                .font(.subheadline)
        }
    }
}
