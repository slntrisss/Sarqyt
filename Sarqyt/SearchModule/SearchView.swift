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
    @State private var hotels = ["Palazzo Hotel", "Bulgari Hotel", "Amsterdam, Netherlands", "Martinez Channes Hotel", "Palms Casino Hotel", "London, UK", ]
    @State private var addresses = ["9613 Bellevue St.Athens, GA 30605", "940 N. Delaware Road Uniondale, NY 11553", "4 West Alton Avenue Torrance, CA 90505", "62 Shadow Brook Lane Fenton, MI 48430", "20 Bridgeton St.Thibodaux, LA 70301", "67 Thomas Bradenton, FL 34203"]
    @State private var searchTextFiledTapped = false
    @State private var filterButtonTapped = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                SearchTextFeld(filterButtonTapped: $filterButtonTapped, searchQuery: $searchQuery, searchTextFieldTapped: $searchTextFiledTapped)
                CategoryCollectionView(categories: categories, selectedCategories: $selectedCategories, selectedCategoriIndex: $selectedCategoryIndex)
                    .padding(.vertical)
                if searchTextFiledTapped{
                    SearchResultsView(hotels: $hotels, addresses: $addresses)
                }else{
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
                
            }
            .sheet(isPresented: $filterButtonTapped, content: {
                NavigationView{
                    FilterView()
                }
            })
            .navigationTitle("Restaurant Search")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
