//
//  HistoryRestaurantCardView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct HistoryRestaurantCardView: View{
    let restaurantName: String
    let address: String
    let status: BookingView.BookingStatus
    var body: some View{
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image("hotel")
                            .resizable()
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack(alignment: .leading, spacing: 10){
                    Text(restaurantName)
                        .foregroundColor(.primary)
                        .font(.headline.weight(.semibold))
                    
                    Text(address)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                    
                    Text(status.rawValue)
                        .foregroundColor(status == .canceled ? .red : .green)
                        .font(.caption2.weight(.medium))
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(
                            status == .canceled ? Color(hex: "#FDDDDD") : Color(hex: "#E3F6EB")
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(maxWidth:.infinity, maxHeight: 1)
            
        }
        .padding(.vertical)
    }
}
