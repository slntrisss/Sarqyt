//
//  SearchTextField.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct SearchTextFeld: View{
    @Binding var filterButtonTapped: Bool
    @Binding var searchQuery: String
    @Binding var searchTextFieldTapped: Bool
    @FocusState private var inFocus: Bool
    var body: some View{
        HStack{
            Button{
                inFocus = true
                withAnimation(.easeInOut(duration: 0.5)) {
                    searchTextFieldTapped = true
                }
            }label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
            }
            TextField("Search", text: $searchQuery)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        searchTextFieldTapped = true
                    }
                }
                .focused($inFocus)
                .padding()
            Button{
                print("filter button tapped.")
                filterButtonTapped = true
            }label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.green)
            }
            if searchTextFieldTapped{
                Button{
                    print("Cancel button on search textfield tapped.")
                    withAnimation(.easeInOut(duration: 0.5)) {
                        searchTextFieldTapped = false
                        inFocus = false
                    }
                }label: {
                    Text("Cancel")
                        .foregroundColor(.green)
                }
            }
        }
        .customTextField()
    }
}
