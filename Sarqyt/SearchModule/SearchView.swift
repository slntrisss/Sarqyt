//
//  SearchView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 04.02.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchQuery = ""
    private let categories = ["All Hotel", "Recommended", "Popular", "Trending", "High Rated"]
    @State private var selectedCategories = [false, false, false, false, false]
    @State private var selectedCategoryIndex = -1
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            SearchTextFeld(searchQuery: $searchQuery)
            
            CategoryCollectionView(categories: categories, selectedCategories: $selectedCategories, selectedCategoriIndex: $selectedCategoryIndex)
                .padding(.vertical)
            
            HStack{
                Text("Recommended (586,376)")
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.secondary)
                Spacer()
            }
            ForEach(0..<5, id: \.self){ number in
                RestaurantCardInListModeView(userInteractionEnabled: true)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
