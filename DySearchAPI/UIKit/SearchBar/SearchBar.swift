//
//  SearchBar.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/28/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    var onTextChanged: (String) -> Void
    let placeHolderStr = "Tap here to search"
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        var onTextChanged: (String) -> Void
        
        init(text: Binding<String>, onTextChanged: @escaping (String) -> Void) {
            _text = text
            self.onTextChanged = onTextChanged
        }
        
        // Show cancel button when the user begins editing the search text
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            onTextChanged(text)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
            searchBar.backgroundColor = .clear
            // Send back empty string text to search view, trigger ```self.model.searchResults.removeAll()```
            onTextChanged(text)
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, onTextChanged: onTextChanged)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeHolderStr
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.showsCancelButton = true
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
