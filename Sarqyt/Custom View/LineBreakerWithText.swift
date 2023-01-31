//
//  LineBreakerWithText.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI

struct LineBreakerWithText: View{
    let text: String
    var body: some View{
        HStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(.gray.opacity(0.3))
            Text(text)
                .frame(minWidth: 150)
                .scaledToFit()
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(.gray.opacity(0.3))
        }
        .foregroundColor(.secondary)
        .padding(.vertical)
    }
}
