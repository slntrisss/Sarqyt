//
//  LogInView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import SwiftUI

struct CardLogoView: View{
    var body: some View{
        HStack(spacing: 20){
            Button{
                print("Sign in with Meta clicked...")
            } label: {
                SignInWithCardImage(darkModeImageName: nil, lightModeImageName: "google-logo")
            }
            
            Button{
                print("Sign in with Meta clicked...")
            } label: {
                SignInWithCardImage(darkModeImageName: nil, lightModeImageName: "meta-logo")
            }
            
            Button{
                print("Sign in with Meta clicked...")
            } label: {
                SignInWithCardImage(darkModeImageName: "apple-logo-gray", lightModeImageName: "apple-logo")
            }
        }
    }
    
    struct SignInWithCardImage: View{
        @Environment(\.colorScheme) var colorScheme
        let darkModeImageName: String?
        let lightModeImageName: String
        var body: some View{
            Image(colorScheme == .light ? lightModeImageName : darkModeImageName ?? lightModeImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 44)
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).stroke(.gray.opacity(0.5), lineWidth: 1))
        }
    }
}

struct LogInView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var email = ""
    @State private var password = ""
    @State private var checked = false
    @State private var isPasswordHidden = true
    @FocusState private var inFocus: Field?
    @State private var showingAlert = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            //TextField for email
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundColor(.secondary)
                TextField("Email", text: $email, onCommit: {
                    inFocus = .securedPassword
                })
                    .focused($inFocus, equals: .email)
                    .submitLabel(.next)
                    .padding()
            }
            .customTextField()
            
            //TextField for email
            HStack{
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                SecureTextfField(password: $password, isHidden: $isPasswordHidden, secureInFocus: $inFocus){
                    credentialsEntered()
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
                Text("Logged in")
            }label: {
                PrimaryButton(buttonLabel: "Sign In")
            }
            .padding(.vertical)
            
            Button{
                print("Forgot password button is clicked")
            }label: {
                Text("Forgot password?")
                    .foregroundColor(.green)
            }
            .padding(.bottom)
            
            LineBreakerWithText(text: "or continue with")
            
            CardLogoView()
                .padding(.vertical)
            
            HStack{
                Text("Don't have an account?")
                    .foregroundColor(.secondary)
                NavigationLink{
                    Text("Create an account")
                }label: {
                    Text("Sign Up")
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .alert("Credentials Error", isPresented: $showingAlert) {
            Button("OK"){}
        }message: {
            Text("Email or password has not been provided. Please make sure that all fields are properly formed.")
        }
    }
    
    enum Field: Hashable{
        case email, securedPassword, revealedPassword
    }
    
    func credentialsEntered() {
        if email.isEmpty || password.isEmpty{
            showingAlert = true
        }
        print("Logged in")
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LogInView()
        }
    }
}
