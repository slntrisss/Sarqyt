//
//  ForgotPasswordMainView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 02.02.2023.
//

import SwiftUI

struct SelectContactDetailView: View{
    @Binding var tapped: Bool
    let contactDetailIcon: String
    let contactDetailType: String
    let contactDetail: String
    var completionHandler: () -> ()
    var body: some View{
        HStack(spacing: 20){
            Image(systemName: contactDetailIcon)
                .foregroundColor(.green)
                .padding()
                .background(.green.opacity(0.3))
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(contactDetailType)
                    .foregroundColor(.secondary)
                
                Text(contactDetail)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .frame(maxWidth: .infinity)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(tapped ? .green : .secondary, lineWidth: 1)
        )
        .onTapGesture {
            tapped = true
            completionHandler()
        }
    }
}

struct ForgotPasswordMainView: View {
    @State private var smsContactDetailTapped = false
    @State private var emailContactDetailTapped = false
    @State private var showingVerificationScreen = false
    @State private var showingAlert = false
    var body: some View {
        VStack{
            Image("lock")
                .resizable()
                .scaledToFit()
            
            Text("Select which contact details should we use to reset your password")
                .foregroundColor(.secondary)
            
            VStack{
                SelectContactDetailView(tapped: $smsContactDetailTapped, contactDetailIcon: "message.fill", contactDetailType: "via SMS", contactDetail: "+7 ********94") {
                    print("via SMS contact Detail selected.")
                }
                .onChange(of: smsContactDetailTapped, perform: {_ in
                    if smsContactDetailTapped{
                        emailContactDetailTapped = false
                    }
                })
                SelectContactDetailView(tapped: $emailContactDetailTapped, contactDetailIcon: "envelope.fill", contactDetailType: "via Email", contactDetail: "********0001@mail.ru") {
                    print("via Email contact Detail selected.")
                }
                .onChange(of: emailContactDetailTapped, perform: {_ in
                    if emailContactDetailTapped{
                        smsContactDetailTapped = false
                    }
                })
            }
            .padding(.vertical)
            
            PrimaryButton(buttonLabel: "Continue") {
                if smsContactDetailTapped || emailContactDetailTapped{
                    showingVerificationScreen = true
                }else{
                    showingAlert = true
                }
            }
            .padding(.vertical)
            
            NavigationLink("", isActive: $showingVerificationScreen) {
                ForgotPasswordCodeVerificationView()
                    .navigationTitle("Code Verification")
                    .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        .alert("Password reset error", isPresented: $showingAlert){
            Button("OK"){}
        }message: {
            Text("Please choose one of password selection options.")
        }
        .padding()
    }
}

struct ForgotPasswordMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ForgotPasswordMainView()
                .navigationTitle("Forgot password")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
