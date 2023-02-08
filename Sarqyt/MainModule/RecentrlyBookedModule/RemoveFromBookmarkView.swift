//
//  RemoveFromBookmarkView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import SwiftUI

struct RemoveFromBookmarkView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showModalView: Bool
    @State private var currHeight: CGFloat = 300
    @State private var prevDragAmount = CGSize.zero
    let minHeight: CGFloat = 250
    let maxHeight: CGFloat = 320
    var body: some View {
        ZStack(alignment: .bottom){
            if showModalView{
                Color.black
                    .opacity(0.5)
                
                VStack{
                    ZStack{
                        Capsule()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: 40, maxHeight: 6)
                            .padding()
                    }
                    .gesture(dragGesture)
                    ZStack{
                        //Content
                        VStack{
                            Text("Remove from bookmark?")
                                .font(.title.weight(.semibold))
                            Rectangle()
                                .fill(.gray.opacity(0.5))
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .padding(.bottom)
                                .padding(.horizontal)
                            
                            RestaurantCardInListModeView(userInteractionEnabled: false)
                            
                            PopUpViewActionButtons(buttonLabel1: "Cancel", buttonLabel2: "Yes, Remove")
                            .padding(.vertical)
                        }
                        .frame(height: currHeight)
                    }
                    .padding()
                }
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
    
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - prevDragAmount.height
                if currHeight < minHeight{
                    showModalView = false
                }else if currHeight > maxHeight{
                    currHeight -= dragAmount / 6
                    withAnimation {
                        currHeight = 300
                    }
                }else{
                    currHeight -= dragAmount
                }
                prevDragAmount = val.translation
            }
            .onEnded { val in
                currHeight = 300
                prevDragAmount = .zero
            }
    }
}

struct RemoveFromBookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFromBookmarkView(showModalView: .constant(true))
    }
}
