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
    @Published var sections = [String]()
    
    func getProductSearchResult(for name: String, page: Int) {
        webService.getBrandSearchResultsPublisher(for: name, page: page)
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
                self.searchResults = products.results.map(ProductViewModel.init)
                self.getSectionHeaders()
        }.store(in: &self.cancellableSet)
    }
    
    func getSectionHeaders() {
        var arr = [String]()
        if !self.searchResults.isEmpty {
            for item in self.searchResults {
                arr.append(item.productCategory)
            }
            self.sections = Array(Set(arr))
        }
    }
}
