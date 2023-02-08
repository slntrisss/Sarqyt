//
//  CancelBookingView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct PaymentMethodCardView: View{
    @Environment(\.colorScheme) var colorScheme
    let paymentName: String
    let paymentIconName: String
    let paymentIconNameDarkMode: String?
    @Binding var paymentMethodTapped: Bool
    var body: some View{
        HStack{
            HStack{
                Image(colorScheme == .light ? paymentIconName : paymentIconNameDarkMode ?? paymentIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 20)
                Text(paymentName)
            }
            Spacer()
            Image(systemName: paymentMethodTapped ? "circle.inset.filled" : "circle")
                .foregroundColor(.green)
        }
        .padding()
        .background(.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CancelBookingView: View {
    @State private var applePayChecked = false
    @State private var cardChecked = false
    var body: some View {
        VStack{
            Text("Please selecet a payment refund method (only 80% will be refunded).")
                .font(.headline)
                .foregroundColor(.secondary)
            VStack(spacing: 20){
                PaymentMethodCardView(paymentName: "Apple Pay", paymentIconName: "apple-logo", paymentIconNameDarkMode: "apple-logo-gray", paymentMethodTapped: $applePayChecked)
                    .onTapGesture {
                        applePayChecked.toggle()
                        if applePayChecked{
                            cardChecked = false
                        }
                    }
                PaymentMethodCardView(paymentName: "•••• •••• •••• 6667", paymentIconName: "mastercard-logo", paymentIconNameDarkMode: nil, paymentMethodTapped: $cardChecked)
                    .onTapGesture {
                        cardChecked.toggle()
                        if cardChecked{
                            applePayChecked = false
                        }
                    }
            }
            .padding(.vertical)
            Spacer()
            VStack{
                HStack(spacing: 30){
                    Text("Paid: $479.5")
                        .foregroundColor(.secondary)
                        .strikethrough()
                    
                    Text("Refund: $383.3")
                        .foregroundColor(.primary.opacity(0.8))
                }
                .font(.callout.weight(.semibold))
                PrimaryButton(buttonLabel: "Confirm Cancellation") {
                    print("Cancel booking button tapped.")
                }
            }
        }
        .padding()
        .navigationTitle("Cancel Hotel Booking")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CancelBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CancelBookingView()
        }
        .preferredColorScheme(.dark)
    }
}
