//
//  FilterView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    private let cities = ["Almaty", "Astana", "Semey", "Zharkent", "Taldykorgan"]
    @State private var selectedCities = [true, false, false, false, false]
    @State private var selectedCityIndex = 0
    
    private let categories = ["Highest Priority", "Highest price", "Lowest price", "Trending", "Popular"]
    @State private var selectedCategories = [false, true, false, false, false]
    @State private var selectedCategoryIndex = 1
    
    @State private var from = 10_000
    @State private var to = 100_000
    
    private let stars = [5, 4, 3, 2, 1]
    @State private var selectedStars = [true, false, false, false, false]
    @State private var selectedStarIndex = 0
    
    private let facilities = ["Wi-Fi", "Parking", "Music"]
    @State private var selectedfFacilities = [true, false, false]
    @State private var selectedFacilitysIndex = 0
    
    var body: some View {
        ScrollView{
            
            Rectangle()
                .fill(.gray.opacity(0.5))
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.bottom)
                .padding(.horizontal)
            VStack{
                HStack{
                    Text("City")
                        .font(.body.bold())
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("See All")
                            .foregroundColor(.green)
                    }
                }
                
                CategoryCollectionView(categories: cities, selectedCategories: $selectedCities, selectedCategoriIndex: $selectedCityIndex)
            }
            .padding(.bottom)
            
            VStack{
                HStack{
                    Text("Sort Results")
                        .font(.body.bold())
                    Spacer()
                }
                
                CategoryCollectionView(categories: categories, selectedCategories: $selectedCategories, selectedCategoriIndex: $selectedCategoryIndex)
            }
            .padding(.bottom)
            
            VStack{
                HStack{
                    Text("Price range")
                        .font(.body.bold())
                    Spacer()
                }
                
                HStack{
                    HStack{
                        Text("from")
                            .foregroundColor(.secondary)
                        TextField("", value: $from, format: .number)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        Rectangle()
                            .stroke(.secondary, lineWidth: 0.5)
                    )
                    
                    HStack{
                        Text("to")
                            .foregroundColor(.secondary)
                        TextField("", value: $from, format: .number)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .background(
                        Rectangle()
                            .stroke(.secondary, lineWidth: 0.5)
                    )
                }
                
                PriceSlider(totalWidth: screenWidth)
            }
            .padding(.bottom)
            
            VStack{
                HStack{
                    Text("Star Rating")
                        .font(.body.bold())
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0..<5, id: \.self){ index in
                            HStack{
                                Image(systemName: "star.fill")
                                Text("\(stars[index])")
                            }
                            .foregroundColor(selectedStars[index] ? .white : .green)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(selectedStars[index] ? .green : (colorScheme == .light ? .white : .black))
                            .overlay(
                                Capsule()
                                    .strokeBorder(.green, lineWidth: 2)
                            )
                            .clipShape(Capsule())
                            .onTapGesture {
                                print("\(stars[index]) tapped.")
                                if selectedStarIndex >= 0{
                                    selectedStars[selectedStarIndex] = false
                                }
                                selectedStars[index] = true
                                selectedStarIndex = index
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            
            VStack{
                HStack{
                    Text("Facilities")
                        .font(.body.bold())
                    Spacer()
                }
                
                HStack(spacing: 20){
                    ForEach(0..<facilities.count, id: \.self){ index in
                        Toggle(isOn: $selectedfFacilities[index]) {
                            Text(facilities[index])
                        }
                        .toggleStyle(CheckboxStyle())
                    }
                }
            }
            .padding(.bottom)
            
            HStack{
                Button{
                    
                }label: {
                    Text("Cancel")
                        .font(.body.weight(.semibold))
                        .foregroundColor(colorScheme == .light ? .green.opacity(3) : .white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Capsule()
                                .fill(colorScheme == .light ? Color(hex: "E8F8EF") : .gray.opacity(0.15))
                        )
                }
                
                Button{
                    
                }label: {
                    Text("Apply Filter")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Capsule()
                                .fill(.green)
                                .shadow(color: .green, radius: 1, x: 0, y: 1)
                        )
                }
            }
            .padding(.vertical)
        }
        .padding(30)
        .navigationTitle("Filter")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    print("Cancel button tapped")
                    dismiss()
                }label: {
                    Text("Cancel")
                        .foregroundColor(.green)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    print("Reset button tapped")
                }label: {
                    Text("Reset")
                        .foregroundColor(.green)
                }
            }
        }
    }
    
    var screenWidth: CGFloat{
        return UIScreen.main.bounds.width - 100
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FilterView()
        }
    }
}
