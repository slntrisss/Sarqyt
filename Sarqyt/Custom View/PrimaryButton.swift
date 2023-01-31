//
//  PrimaryButton.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI

struct PrimaryButton: View{
    let buttonLabel: String
    var body: some View{
        Text(buttonLabel)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 5, x: 0, y: 1)
    }
}
