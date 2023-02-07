//
//  ForgotPasswordCodeVerification.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 03.02.2023.
//

import SwiftUI

struct ForgotPasswordCodeVerificationView: View {
    let contactDetail: String = "+7 ********94"
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var number3 = ""
    @State private var number4 = ""
    @FocusState private var inFocus: VerificationField?
    @State private var resendCodeButtonDisabled = true
    @State private var timeRemaining: Int = 5
    @State private var validCode = false
    @State private var showingCodeVerificationAlert = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Text("Code has been sent to \(contactDetail)")
                .foregroundColor(.primary.opacity(0.7))
            
            //Character Input Cell
            HStack{
                TextField("", text: $number1)
                    .keyboardType(.numberPad)
                    .frame(width:44, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 1)
                    )
                    .multilineTextAlignment(.center)
                    .focused($inFocus, equals: .number1)
                    .onChange(of: number1) { newValue in
                        if newValue.count == 1{
                            inFocus = .number2
                        }
                    }
                
                TextField("", text: $number2)
                    .keyboardType(.numberPad)
                    .frame(width:44, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 1)
                    )
                    .multilineTextAlignment(.center)
                    .focused($inFocus, equals: .number2)
                    .onChange(of: number2) { newValue in
                        if newValue.count == 1{
                            inFocus = .number3
                        }else if newValue.isEmpty{
                            inFocus = .number1
                        }
                    }
                
                TextField("", text: $number3)
                    .keyboardType(.numberPad)
                    .frame(width:44, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 1)
                    )
                    .multilineTextAlignment(.center)
                    .focused($inFocus, equals: .number3)
                    .onChange(of: number3) { newValue in
                        if newValue.count == 1{
                            inFocus = .number4
                        }else if newValue.isEmpty{
                            inFocus = .number2
                        }
                    }
                
                TextField("", text: $number4)
                    .keyboardType(.numberPad)
                    .frame(width:44, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 1)
                    )
                    .multilineTextAlignment(.center)
                    .focused($inFocus, equals: .number4)
                    .onChange(of: number4) { newValue in
                        if newValue.count == 1{
                            verificationCodeEntered()
                        }else if newValue.isEmpty{
                            inFocus = .number3
                        }
                    }
            }
            
            Button{
                print("Resending code...")
            }label: {
                Text(resendCodeButtonDisabled ? "Resend code in \(timeRemaining) s" : "Resend Code")
                    .onReceive(timer, perform: {_ in
                        if timeRemaining <= 1{
                            resendCodeButtonDisabled = false
                        }else{
                            timeRemaining -= 1
                        }
                    })
            }
            .disabled(resendCodeButtonDisabled)
            
            NavigationLink("", isActive: $validCode) {
                ChangePasswordView()
            }
        }
        .onAppear(perform: { inFocus = .number1})
        .alert("Code Verification Error", isPresented: $showingCodeVerificationAlert) {
            Button("OK"){}
        }message: {
            Text("Provided verification code is invalid. Please try again.")
        }
    }
    
    private enum VerificationField: Hashable{
        case number1, number2, number3, number4
    }
    
    func verificationCodeEntered(){
        let code = number1 + number2 + number3 + number4
        print(code)
        if code == "4575"{
            validCode = true
        }
        else{
            showingCodeVerificationAlert = true
        }
    }
}

struct ForgotPasswordCodeVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ForgotPasswordCodeVerificationView()
                .navigationTitle("Code Verificatio")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
