//
//  ChangePasswordView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 03.02.2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var password = ""
    @State private var confirmationPassword = ""
    @State private var isPasswordHidden = true
    @FocusState private var inFocus: RegistrationField?
    @State private var checked = false
    @State private var showPasswordAlert = false
    var body: some View {
        VStack{
            Image("security")
            
            Spacer()
            HStack{
                Text("Create your new password")
                    .foregroundColor(.secondary)
                Spacer()
            }
            //Password field
            HStack{
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                SecurePassword(password: $password, isHidden: $isPasswordHidden, secureInFocus: $inFocus) {
                    print("password entered.")
                }
                .padding()
                Button{
                    isPasswordHidden.toggle()
                }label: {
                    Image(systemName: isPasswordHidden ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.secondary)
                }
            }
            .customTextField()
            .padding(.vertical)
            
            //Password confirmation field
            HStack{
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                ConfirmationPasswordField(password: $confirmationPassword, isHidden: $isPasswordHidden, secureInFocus: $inFocus) {
                    print("password entered.")
                }
                .padding()
            }
            .customTextField()
            
            //Remember me checkbox
            HStack{
                Toggle(isOn: $checked) {
                    Text("Remember me")
                }
                .toggleStyle(CheckboxStyle())
                Spacer()
            }
            .padding(.vertical)
            
            Spacer()
            
            PrimaryButton(buttonLabel: "Continue") {
                print("Password changed.")
            }
            
            Spacer()
        }
        .alert("Password", isPresented: $showPasswordAlert) {
            Button("OK"){}
        }message: {
            Text("Provided passwords do not match. Please try again.")
        }
        .padding()
    }
    
    func confirmPassword(){
        if password == confirmationPassword{
            
        }else{
            showPasswordAlert = true
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChangePasswordView()
                .navigationTitle("Change Password")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
