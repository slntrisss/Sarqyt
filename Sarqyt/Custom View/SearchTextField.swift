//
//  SearchTextField.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct SearchTextFeld: View{
    @Binding var searchQuery: String
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Search", text: $searchQuery)
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
