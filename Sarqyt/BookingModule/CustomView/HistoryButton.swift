//
//  HistoryButton.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI
struct HistoryButton: View{
    @Environment(\.colorScheme) var colorScheme
    let title: String
    @Binding var tapped: Bool
    var body: some View{
        Button{
            print("Ongoing button tapped.")
            tapped = true
        }label: {
            Text(title)
                .font(.callout.bold())
                .foregroundColor(tapped ? .white : .green)
                .padding()
                .background(
                    tapped ? .green : (colorScheme == .light ? .white : .black)
                )
                .overlay(
                    Capsule()
                        .strokeBorder(.green, lineWidth: 2)
                )
                .clipShape(Capsule())
        }
    }
}
