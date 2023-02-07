//
//  SearchTextField.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct SearchTextFeld: View{
    @Binding var searchQuery: String
    @FocusState private var inFocus: Bool
    var body: some View{
        HStack{
            Button{
                inFocus = true
            }label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
            }
            TextField("Search", text: $searchQuery)
                .focused($inFocus)
                .padding()
            Button{
                print("filter button tapped.")
            }label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.green)
            }
        }
        .customTextField()
    }
}
