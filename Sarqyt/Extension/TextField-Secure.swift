//
//  TextField-Secure.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI

struct PasswordModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .textContentType(.password)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}

extension TextField{
    func passwordMode() -> some View{
        modifier(PasswordModifier())
    }
}


extension SecureField{
    func passwordMode() -> some View{
        modifier(PasswordModifier())
    }
}
