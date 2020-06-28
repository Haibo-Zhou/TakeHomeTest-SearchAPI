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
//    @State private var selectedId = -1
//    @State private var showSheet = false
    @State private var page = 1
    @State private var idx = 0
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onTextChanged: searchProducts)
                List {
                    ForEach(model.sections, id: \.self) { section in
                        Section(header: Text(section)) {
                            ForEach(0..<self.model.searchResults.filter { $0.productCategory == section }.count, id: \.self) { i in
                                ProductListRow(product: self.model.searchResults.filter { $0.productCategory == section }[i])
                                .onAppear() {
                                    if i == self.model.searchResults.count - 1 {
                                        self.page += 1
                                        self.model.getProductSearchResult(for: self.searchText, page: self.page)
                                    }
                                }
                            }
                        }
                    }
                }.simultaneousGesture(DragGesture().onChanged({ _ in
                    // dismiss keyboard when scrolling begins
                    UIApplication.shared.endEditing()
                }))
                .navigationBarTitle("Search")
                .listStyle(GroupedListStyle())
            }
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
            self.model.sections.removeAll()
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

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
