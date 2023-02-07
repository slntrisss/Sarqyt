//
//  SearchResultsView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct SearchResultsView: View{
    @Binding var hotels: [String]
    @Binding var addresses: [String]
    var body: some View{
        VStack{
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(maxWidth: .infinity, maxHeight: 1)
            
            HStack{
                Text("Recent")
                    .font(.caption.bold())
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            
            ScrollView{
                ForEach(0..<hotels.count, id: \.self){ index in
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text(hotels[index])
                                .foregroundColor(.primary.opacity(0.7))
                            Text(addresses[index])
                                .foregroundColor(.secondary)
                                .font(.caption2)
                        }
                        .lineLimit(1)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .overlay(
                        Rectangle()
                            .frame(height: 0.2, alignment: .bottom)
                            .foregroundColor(.secondary),
                        alignment: .bottom
                    )
                }
                Button{
                    print("Clear search results tapped.")
                }label: {
                    Text("Clear Search Results")
                        .foregroundColor(.green)
                }
                .padding(.vertical)
            }
        }
        .transition(.move(edge: .leading))
    }
}
