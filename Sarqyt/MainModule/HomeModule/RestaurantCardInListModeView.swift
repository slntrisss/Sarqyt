//
//  RestaurantCardView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import SwiftUI

struct RestaurantCardInListModeView: View{
    let userInteractionEnabled: Bool
    @State private var showRemoveBookmarkView = false
    var body: some View{
        HStack{
            Rectangle()
                .frame(width: 100, height: 100)
                .overlay(
                    Image("hotel")
                        .resizable()
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment:.leading, spacing: 10){
                HStack{
                    Text("President Hotel")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                    Spacer()
                    Text("35$")
                        .font(.title.bold())
                        .foregroundColor(.green)
                    
                }
                
                Text("Paris, France")
                    .foregroundColor(.secondary)
                
                HStack{
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.8")
                            .font(.body.weight(.semibold))
                    }
                    Text("4,784 (reviews)")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    Spacer()
                    Button{
                        showRemoveBookmarkView = true
                        NotificationCenter.default.post(name: Notification.RemoveRestaurantBookmarkClicked, object: nil)
                    }label: {
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(.green)
                    }
                    .disabled(!userInteractionEnabled)
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

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardInListModeView(userInteractionEnabled: true)
    }
}
