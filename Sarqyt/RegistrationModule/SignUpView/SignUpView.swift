//
//  SignUpView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 02.02.2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmationPassword = ""
    @State private var checked = false
    @State private  var isPasswordHidden = true
    @FocusState private var inFocus: RegistrationField?
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundColor(.secondary)
                TextField("Email", text: $email, onCommit: {
                    inFocus = .securedPassword
                })
                .textInputAutocapitalization(.never)
                .focused($inFocus, equals: .email)
                .submitLabel(.next)
                .padding()
            }
            .customTextField()
            
            //TextField for password
            HStack{
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                SecurePassword(password: $password, isHidden: $isPasswordHidden, secureInFocus: $inFocus){
                    
                }
                .padding()
                Button{
                    isPasswordHidden.toggle()
                } label: {
                    Image(systemName: isPasswordHidden ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.secondary)
                }
            }
            .customTextField()
            .padding(.top)
            
            HStack{
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                ConfirmationPasswordField(password: $password, isHidden: $isPasswordHidden, secureInFocus: $inFocus){
                    
                }
                .padding()
            }
            .customTextField()
            .padding(.vertical)
            
            //Remember me checkbox
            HStack{
                Toggle(isOn: $checked) {
                    Text("Remember me")
                }
                .toggleStyle(CheckboxStyle())
                Spacer()
            }
            .padding(.vertical)
            
            
            NavigationLink{
                RegistrationView()
                    .navigationTitle("Fill your profile")
                    .navigationBarTitleDisplayMode(.inline)
            }label: {
                PrimaryButton(buttonLabel: "Sign In"){
                    print("Sign in button clicked.")
                }
            }
            .padding(.vertical)
            
            LineBreakerWithText(text: "or continue with")
            
            CardLogoView()
                .padding(.vertical)
            
        }
        .padding()
    }
    
    private enum Field: Hashable{
        case email, securedPassword, revealedPassword, securedConfirmationPassword, revealedConfirmationPaswword
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUpView()
                .navigationTitle("Sign Up")
        }
    }
}
