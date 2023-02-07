//
//  ConfirmationPasswordField.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 02.02.2023.
//

import SwiftUI

struct ConfirmationPasswordField: View {
    @Binding var password: String
    @Binding var isHidden: Bool
    var secureInFocus: FocusState<RegistrationField?>.Binding
    var completeion: () -> Void
    var body: some View{
        ZStack(alignment: .leading) {
            TextField("Confirm Password", text: $password, onCommit: {
                completeion()
            })
            .passwordMode()
            .submitLabel(.return)
            .focused(secureInFocus, equals: .revealedConfirmationPassword)
            .opacity(isHidden ? 0 : 1)
            SecureField("Confirm Password", text: $password, onCommit: {
                completeion()
            })
            .passwordMode()
            .submitLabel(.return)
            .focused(secureInFocus, equals: .securedConfirmationPassword)
            .opacity(isHidden ? 1 : 0)
        }
        .onChange(of: isHidden, perform: { newValue in
            if newValue{
                secureInFocus.wrappedValue = .securedConfirmationPassword
            }else{
                secureInFocus.wrappedValue = .revealedConfirmationPassword
            }
        })
    }
}
