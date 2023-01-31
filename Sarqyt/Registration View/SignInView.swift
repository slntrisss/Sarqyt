//
//  LogInView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 31.01.2023.
//

import SwiftUI

struct SignInWithTemplate: View{
    let text: String
    let logo: String
    var body: some View{
        HStack{
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
            
            Text("Continue with \(text)")
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack{
            Spacer()
            VStack{
                SignInWithTemplate(text: "Google", logo: "google-logo")
                SignInWithTemplate(text: "Meta", logo: "meta-logo")
                SignInWithTemplate(text: "Apple", logo: colorScheme == .dark ? "apple-logo-gray" : "apple-logo")
            }
            
            HStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.gray.opacity(0.3))
                Text("or")
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(.gray.opacity(0.3))
            }
            .foregroundColor(.secondary)
            .padding(.vertical)
            
            NavigationLink{
                LogInView()
                    .navigationTitle("Log In")
            }label: {
                Text("Sign in with password")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .gray, radius: 5, x: 0, y: 1)
            }
            
            Spacer()
            
            HStack{
                Text("Don't have an account?")
                    .foregroundColor(.secondary)
                Button("Sign Up"){}
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
