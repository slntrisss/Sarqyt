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
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Button{
                    print("")
                } label: {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.secondary)
                }
                TextField("Email", text: $email)
                    .padding()
            }
            .padding(.horizontal)
            .background(colorScheme == .dark ? Color.gray.opacity(0.15) : Color.gray.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            HStack{
                Button{
                    print("")
                } label: {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.secondary)
                }
                TextField("Password", text: $password)
                    .padding()
                Button{
                    print("")
                } label: {
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            .background(colorScheme == .dark ? Color.gray.opacity(0.15) : Color.gray.opacity(0.07))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Toggle(isOn: $checked) {
                Text("Remember me")
            }
            .toggleStyle(CheckboxStyle())
            
            NavigationLink{
                Text("Logged in")
            }label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .gray, radius: 5, x: 0, y: 1)
            }
            
            Button{
                print("")
            }label: {
                Text("Forgot password?")
                    .foregroundColor(.green)
            }
            .padding(.bottom)
            
            HStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.gray.opacity(0.3))
                Text("or continue with")
                    .frame(minWidth: 150)
                    .scaledToFit()
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.gray.opacity(0.3))
            }
            .foregroundColor(.secondary)
            .padding(.vertical)
            
            
            CardLogoView()
            
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
        .navigationTitle("Login")
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LogInView()
        }
        .preferredColorScheme(.dark)
    }
}
