//
//  ProductListViewModel.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI
import Combine


class ProductListViewModel: ObservableObject {
    private var webService = WebService()
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var searchResults = [ProductViewModel]()
    
    func getProductSearchResult(for name: String) {
        webService.getBrandSearchResultsPublisher(for: name)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                switch status {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }) { products in
                self.searchResults = products.map(ProductViewModel.init)
        }.store(in: &self.cancellableSet)
    }
    
}
