//
//  PopUpViewActionButtons.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct PopUpViewActionButtons: View{
    @Environment(\.colorScheme) var colorScheme
    let buttonLabel1: String
    let buttonLabel2: String
    var body: some View{
        HStack{
            Button{
                
            }label: {
                Text(buttonLabel1)
                    .font(.body.weight(.semibold))
                    .foregroundColor(colorScheme == .light ? .green.opacity(3) : .white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Capsule()
                            .fill(colorScheme == .light ? Color(hex: "E8F8EF") : .gray.opacity(0.15))
                    )
            }
            
            Button{
                
            }label: {
                Text(buttonLabel2)
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Capsule()
                            .fill(.green)
                            .shadow(color: .green, radius: 1, x: 0, y: 1)
                    )
            }
        }
    }
}
