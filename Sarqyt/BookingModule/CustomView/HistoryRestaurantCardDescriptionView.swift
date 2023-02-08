//
//  HistoryRestaurantCardDescriptionView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct HistoryRestaurantCardDescriptionView: View{
    @Environment(\.colorScheme) var colorScheme
    let status: BookingView.BookingStatus
    let description: String
    var body: some View{
        Label(description, systemImage: status == .canceled ? "exclamationmark.circle.fill" : "checkmark.square.fill")
            .font(.caption2)
            .foregroundColor(status == .canceled ? .red : .green)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(
                status == .canceled ? (colorScheme == .light ? Color(hex: "#FDDDDD") : Color(hex: "#4A2C33")) : (colorScheme == .light ? Color(hex: "#E3F6EB") : Color(hex: "#1E3430"))
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
