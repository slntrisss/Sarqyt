//
//  CategoryCollectionView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct CategoryCollectionView: View{
    @Environment(\.colorScheme) var colorScheme
    let categories: [String]
    @Binding var selectedCategories: [Bool]
    @Binding var selectedCategoriIndex: Int
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(0..<categories.count, id: \.self){index in
                    Button{
                        print("\(categories[index]) tapped.")
                        if selectedCategoriIndex >= 0{
                            selectedCategories[selectedCategoriIndex] = false
                        }
                        selectedCategories[index] = true
                        selectedCategoriIndex = index
                    }label: {
                        Text(categories[index])
                            .font(.body.weight(.medium))
                            .foregroundColor(selectedCategories[index] ? .white : .green)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(selectedCategories[index] ? .green : (colorScheme == .light ? .white : .black))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(.green, lineWidth: 2)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
        }
    }
}
