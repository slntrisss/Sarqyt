//
//  ViewModifier+BookingHistoryCard.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct HistoryRestaurantCardBackgroundViewModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.06))
            )
    }
}

extension View{
    func historyRestaurantCardBackground() -> some View {
        return modifier(HistoryRestaurantCardBackgroundViewModifer())
    }
}
