//
//  RecentlyBookedView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import SwiftUI

struct RecentlyBookedView: View {
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 140), spacing: 20)
    ]
    private let adaptiveListRows = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    @State private var showInGridMode = false
    @State private var showRemoveBoormarkView = false
    var body: some View {
        ScrollView{
            LazyVGrid(columns: showInGridMode ? adaptiveColumns : adaptiveListRows) {
                ForEach(0..<8) { number in
                    if showInGridMode{
                        RestaurantCardInGridModeView()
                    }else{
                        RestaurantCardInListModeView(userInteractionEnabled: true)
                    }
                }
                .padding(.top, 20)
            }
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                ListOrGridMode(showInGridMode: $showInGridMode)
            }
        }
    }
}

struct RecentlyBookedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecentlyBookedView()
                .navigationTitle("Recently booked")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
