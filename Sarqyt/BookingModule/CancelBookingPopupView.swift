//
//  CancelBookingView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 08.02.2023.
//

import SwiftUI

struct CancelBookingPopupView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currHeight: CGFloat = 320
    @Binding var showModalView: Bool
    let maxHeight: CGFloat = 320
    let minHeight: CGFloat = 280
    var body: some View {
        ZStack(alignment: .bottom){
            if showModalView{
                Color.black
                    .opacity(0.5)
                ZStack{
                    VStack(alignment: .center, spacing: 20){
                        Capsule()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 40, height: 5)
                        
                        Text("Cancel Booking")
                            .font(.title.bold())
                            .foregroundColor(.red)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(height: 1)
                        
                        Text("Are you sure you want cancel your hotel booking?")
                            .font(.title2.bold())
                            .foregroundColor(.primary.opacity(0.7))
                            .multilineTextAlignment(.center)
                        
                        Text("Only 80% f the money you can refund from your payment according your policy")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        
                        PopUpViewActionButtons(buttonLabel1: "Cancel", buttonLabel2: "Yes, Continue")
                            .padding(.bottom, 20)
                    }
                }
                .frame(height: currHeight)
                .gesture(gesture)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colorScheme == .light ? .white : Color(hex: "#1D1D1D"))
                )
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .animation(.spring(), value: showModalView)
        .ignoresSafeArea()
    }
    
    var gesture: some Gesture{
        DragGesture()
            .onChanged { val in
                let dragAmount = val.translation.height
                
                if currHeight > maxHeight{
                    withAnimation {
                        currHeight = 320
                    }
                }else if currHeight < minHeight{
                    showModalView = false
                }else{
                    currHeight -= dragAmount
                }
            }
            .onEnded { _ in
                currHeight = 320
            }
    }
}

struct CancelBookingView_Previews: PreviewProvider {
    static var previews: some View {
        CancelBookingPopupView(showModalView: .constant(true))
    }
}
