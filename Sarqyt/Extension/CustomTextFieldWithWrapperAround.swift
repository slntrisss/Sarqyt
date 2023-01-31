//
//  CustomTextFieldWithWrapperAround.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI

struct CustomTextFieldWithWrapperAround: ViewModifier{
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .background(colorScheme == .dark ? Color.gray.opacity(0.15) : Color.gray.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

extension View {
    func customTextField() -> some View{
        modifier(CustomTextFieldWithWrapperAround())
    }
}
