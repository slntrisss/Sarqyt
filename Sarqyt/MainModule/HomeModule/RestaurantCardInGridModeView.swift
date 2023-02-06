//
//  RestaurantCardInGridModeView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import SwiftUI

struct RestaurantCardInGridModeView: View {
    @State private var showRemoveBookmarkView = false
    var body: some View {
        VStack{
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 120)
                .overlay(
                    Image("hotel")
                        .resizable()
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading, spacing: 20){
                Text("President Mila de Hotel")
                    .font(.title3.bold())
                    .foregroundColor(.primary)
                
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("4.8")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.green)
                    Text("Paris, France")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                
                HStack{
                    Text("35$")
                        .font(.title.bold())
                        .foregroundColor(.green)
                    Spacer()
                    Button{
                        showRemoveBookmarkView = true
                        NotificationCenter.default.post(name: Notification.RemoveRestaurantBookmarkClicked, object: nil)
                    } label: {
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray.opacity(0.16))
        )
    }
}

struct RestaurantCardInGridModeView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardInGridModeView()
    }
}
