//
//  ProductSearchApp.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI

struct ProductSearchApp: View {
    
    @ObservedObject var model = ProductListViewModel()
    @State private var searchText: String = ""
    @State private var selectedId = -1
//    @State private var showSheet = false
    @State private var page = 1
    let server = GCDServer()
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, onTextChanged: searchProducts)
            
            List {
                ForEach(0..<model.searchResults.count, id: \.self) { i in
                    ProductListRow(product: self.model.searchResults[i])
                    .onAppear() {
                        if i == self.model.searchResults.count - 1 {
                            self.page += 1
                            self.model.getProductSearchResult(for: self.searchText, page: self.page)
                        }
                    }
                }
            }.simultaneousGesture(DragGesture().onChanged({ _ in
                // dismiss keyboard when scrolling begins
                UIApplication.shared.endEditing()
            }))
        }
        .onAppear() {
            self.server.initWebServer()
        }
        .onDisappear() {
            self.server.stopWebServer()
        }
    }
    
    func searchProducts(for searchText: String) {
        if !searchText.isEmpty && searchText.lowercased() == "dyson" {
            self.page = 1
            self.model.getProductSearchResult(for: self.searchText, page: self.page)
        } else {
            // remove search result when a user clear keyword.
            self.page = 1
            self.model.searchResults.removeAll()
        }
    }
}

struct ProductSearchApp_Previews: PreviewProvider {
    static var previews: some View {
        ProductSearchApp()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
