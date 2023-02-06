//
//  Toolbar-Main.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import SwiftUI

struct ListOrGridMode: View{
    @Binding var showInGridMode: Bool
    var body: some View{
        HStack{
            Button{
                print("present in list mode is tapped.")
                withAnimation {
                    showInGridMode = false
                }
            }label: {
                Image(systemName: "list.bullet")
                    .font(.body.weight(.heavy))
                    .foregroundColor(showInGridMode ? .secondary : .green)
            }
            
            Button{
                print("present in grid mode is tapped.")
                withAnimation {
                    showInGridMode = true
                }
            }label: {
                Image(systemName: "square.grid.2x2")
                    .font(.body.weight(.heavy))
                    .foregroundColor(showInGridMode ? .green : .secondary)
            }
        }
    }
}
