//
//  PriceSlider.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 07.02.2023.
//

import SwiftUI

struct PriceSliderCircle: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        Circle()
            .strokeBorder(.green, lineWidth: 4)
            .background(colorScheme == .light ? .white : .black)
            .frame(width: 20, height: 20)
            .clipShape(Circle())
    }
}

struct PriceSlider: View {
    @State private var x1: CGFloat = 0
    @State private var x2: CGFloat = 0
    let totalWidth:CGFloat
    var body: some View {
        VStack{
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(.gray.opacity(0.5))
                    .frame(height: 5)
                Rectangle()
                    .fill(.green)
                    .offset(x: x1)
                    .frame(width: (x2 - x1) + 20, height: 5)
                
                HStack(spacing: 0){
                    PriceSliderCircle()
                        .offset(x: x1)
                        .gesture(
                            DragGesture()
                                .onChanged({ val in
                                    if val.location.x >= 0 && val.location.x <= x2 {
                                        self.x1 = val.location.x
                                    }
                                })
                        )
                    
                    PriceSliderCircle()
                        .offset(x: x2)
                        .gesture(
                            DragGesture()
                                .onChanged({ val in
                                    if val.location.x >= x1 && val.location.x <= totalWidth{
                                        self.x2 = val.location.x
                                    }
                                })
                        )
                }
            }
        }
    }
}

struct PriceSlider_Previews: PreviewProvider {
    static var previews: some View {
        PriceSlider(totalWidth: UIScreen.main.bounds.width-40)
    }
}
