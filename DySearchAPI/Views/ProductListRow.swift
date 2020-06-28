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
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                ProductName(product: product)
                StockState(product: product)
            }
            Spacer()
            PriceLabel(product: product)
        }.padding(.vertical)
    }
    
    // MARK: Sub-Component
    struct ProductName: View {
        var product: ProductViewModel
        
        var body: some View {
            Text(product.productName)
                .font(.headline)
                .foregroundColor(.primary)
        }
    }
    
    struct StockState: View {
        var product: ProductViewModel
        
        var body: some View {
            Text(product.inStock)
                .font(.system(size: 12, weight: .regular, design: .default))
                .foregroundColor(.gray)
        }
    }
    
//    fileprivate func createPriceLabel() -> some View {
//
//    }
    
    struct PriceLabel: View {
        var product: ProductViewModel
        
        var body: some View {
            if product.inStock == "Out-of-stock" {
                return Text(String(product.price))
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .padding(5)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
            } else {
                return Text(String(product.price))
                .font(.system(size: 15, weight: .regular, design: .default))
                .padding(5)
                    .background(Color.lightBlue)
                .cornerRadius(10)
                .foregroundColor(.blue)
            }
        }
    }
}
