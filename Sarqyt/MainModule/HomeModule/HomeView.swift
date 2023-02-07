//
//  HomeView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 04.02.2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var searchQuery = ""
    let categories = ["Recommended", "Trending", "Popular", "New", "High rated"]
    @State private var selectedCategories: [Bool] = [false, false, false, false, false]
    @State private var selectedCategoriIndex = -1
    
    private var title = "Esmeralda de Hotel"
    private var location = "Paris/France"
    private var cost = 30
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                SearchTextFeld(searchQuery: $searchQuery)
                //Category collection view
                CategoryCollectionView(categories: categories, selectedCategories: $selectedCategories, selectedCategoriIndex: $selectedCategoriIndex)
                .padding(.vertical)
                
                //Restaurant images
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(0..<3, id: \.self){ image in
                            ZStack{
                                Image("hotel")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width * 0.7)
                                
                                VStack{
                                    HStack{
                                        Spacer()
                                        HStack{
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.white)
                                            Text("4.8")
                                                .font(.body.bold())
                                                .foregroundColor(.white)
                                        }
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(
                                            Capsule()
                                                .fill(.green)
                                        )
                                    }
                                    .padding()
                                    Spacer()
                                    VStack{
                                        Text("Emeralda De Hotel")
                                            .foregroundColor(.white)
                                            .font(.title.bold())
                                        Text("Paris/France")
                                            .foregroundColor(.white)
                                        HStack{
                                            HStack{
                                                Text("29$")
                                                    .font(.title.bold())
                                                Text("/")
                                                Text("per night")
                                            }
                                            Spacer()
                                            Button{
                                                print("bookmark on main slider image clicked.")
                                            }label: {
                                                Image(systemName: "bookmark")
                                            }
                                        }
                                        .foregroundColor(.white)
                                        .padding()
                                    }
                                    .padding()
                                    .background(
                                        LinearGradient(gradient:
                                                        Gradient(colors: [
                                                            .black,
                                                            .black.opacity(0.9),
                                                            .black.opacity(0.7),
                                                            .black.opacity(0.5),
                                                            .black.opacity(0.3)
                                                        ]),
                                                       startPoint: .bottom,
                                                       endPoint: .top)
                                        .opacity(0.7)
                                    )
                                }
                            }
                        }
                        .clipShape(
                            RoundedRectangle(cornerRadius: 30)
                        )
                    }
                }
                .padding(.vertical)
                
                //Recently booked
                
                VStack{
                    HStack{
                        Text("Recently booked")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.secondary)
                        Spacer()
                        NavigationLink{
                            RecentlyBookedView()
                                .navigationBarTitle("Recently booked")
                                .navigationBarTitleDisplayMode(.inline)
                        }label: {
                            Text("See All")
                                .font(.caption.weight(.semibold))
                                .foregroundColor(.green)
                        }
                    }
                    ForEach(0..<3, id: \.self){ numver in
                        RestaurantCardInListModeView(userInteractionEnabled: true)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                        Text("Sarqyt")
                            .font(.title.weight(.semibold))
                        Spacer()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button{
                            print("Notification button clicked.")
                        }label: {
                            Image(systemName: "bell")
                                .foregroundColor(.primary)
                        }
                        NavigationLink{
                            RecentlyBookedView()
                                .navigationBarTitle("My Bookmark")
                                .navigationBarTitleDisplayMode(.inline)
                        }label: {
                            Image(systemName: "bookmark")
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .navigationTitle("Hello, Raim 👋")
            .padding()
            
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
