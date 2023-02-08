//
//  Notification+Bookmark.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 06.02.2023.
//

import Foundation

extension Notification{
    static let RemoveRestaurantBookmarkClicked = Notification.Name.init(rawValue: "com.Sarqyt.RemoveRestaurantBookmarkClicked")
    
    static let PopupCancelBookingButtonTapped = Notification.Name.init(rawValue: "com.Sarqyt.PopupCancelBookingButtonTapped")
    
    static let ShowCancelBookingViewButtonTapped = Notification.Name.init(rawValue: "com.Sarqyt.ShowCancelBookingViewButtonTapped")
}
