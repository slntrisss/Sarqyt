//
//  HistoryRestaurantCardButtons.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct HistoryRestaurantCardButtons: View{
    var body: some View{
        HStack{
            Button{
                print("Cancel booking button tapped.")
                NotificationCenter.default.post(name: Notification.PopupCancelBookingButtonTapped, object: nil)
            }label: {
                Text("Cancel Booking")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.green)
                    .frame(width: 130)
                    .padding()
                    .overlay(
                        Capsule()
                            .strokeBorder(.green, lineWidth: 1)
                    )
            }
            Button{
                print("View Ticket button tapped.")
            }label: {
                Text("View Ticket")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: 130)
                    .padding()
                    .background(
                        .green
                    )
                    .clipShape(Capsule())
            }
        }
    }
}
