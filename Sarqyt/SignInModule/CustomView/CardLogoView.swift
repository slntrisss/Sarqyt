//
//  CardLogoView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 02.02.2023.
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
