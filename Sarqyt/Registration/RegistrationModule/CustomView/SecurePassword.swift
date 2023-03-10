//
//  SecureTextField.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI

struct SecurePassword: View{
    @Binding var password: String
    @Binding var isHidden: Bool
    var secureInFocus: FocusState<RegistrationField?>.Binding
    var completeion: () -> Void
    var body: some View{
        ZStack(alignment: .leading) {
            TextField("Password", text: $password, onCommit: {
                completeion()
            })
                .passwordMode()
                .submitLabel(.return)
                .focused(secureInFocus, equals: .revealedPassword)
                .opacity(isHidden ? 0 : 1)
            SecureField("Password", text: $password, onCommit: {
                completeion()
            })
                .passwordMode()
                .submitLabel(.return)
                .focused(secureInFocus, equals: .securedPassword)
                .opacity(isHidden ? 1 : 0)
        }
        .onChange(of: isHidden, perform: { newValue in
            if newValue{
                secureInFocus.wrappedValue = .securedPassword
            }else{
                secureInFocus.wrappedValue = .revealedPassword
            }
        })
    }
}
