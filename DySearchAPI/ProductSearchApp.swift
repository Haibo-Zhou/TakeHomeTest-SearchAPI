////
////  ProductSearchApp.swift
////  DySearchAPI
////
////  Created by Chuck.Zhou on 6/28/20.
////  Copyright © 2020 Haibo Family. All rights reserved.
////
//
//import SwiftUI
//
//struct ProductSearchApp: View {
//    
//    @ObservedObject var model = ProductListViewModel()
//    @State private var searchText: String = ""
//    @State private var selectedId = -1
//    @State private var showSheet = false
//    @State private var page = 1
//    
//    var body: some View {
//        VStack {
//            SearchBar(text: $searchText, onTextChanged: searchMovies)
//            
//            List {
//                ForEach(0..<model.searchResults.count, id: \.self) { i in
//                    ProductListRow(product: self.model.searchResults[i])
//                        .onTapGesture {
//                            self.selectedId = self.model.searchResults[i].id
//                            self.showSheet.toggle()
//                        }
//                    .onAppear() {
//                        if i == self.model.searchResults.count - 1 {
//                            self.page += 1
//                            self.model.getMovieSearchResults(for: self.searchText, page: self.page)
//                        }
//                    }
//                }
//            }.simultaneousGesture(DragGesture().onChanged({ _ in
//                // dismiss keyboard when scrolling begins
//                UIApplication.shared.endEditing()
//            }))
//            .sheet(isPresented: $showSheet) {
//                SingleMovieView(movieId: self.selectedId)
//            }
//            
//        }
//    }
//    
//    func searchMovies(for searchText: String) {
//        if !searchText.isEmpty {
//            self.page = 1
//            self.model.getMovieSearchResults(for: self.searchText, page: self.page)
//        } else {
//            // remove search result when a user clear keyword.
//            self.page = 1
//            self.model.searchResults.removeAll()
//        }
//    }
//}
//
//struct ProductSearchApp_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductSearchApp()
//    }
//}
