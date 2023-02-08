//
//  MainView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 04.02.2023.
//

import SwiftUI

struct MainView: View {
    @State private var showRemoveBookmarkView = false
    @State private var showCancelBookingView = false
    init(){
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }
    var body: some View {
        ZStack{
            TabView{
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                BookingView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                        Text("Booking")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .accentColor(.green)
            .onReceive(NotificationCenter.default.publisher(for: Notification.RemoveRestaurantBookmarkClicked)) { _ in
                showRemoveBookmarkView = true
                print("show")
            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.CancelBookingButtonTapped)) { _ in
                showCancelBookingView = true
                print("Modal view pop up")
            }
            RemoveFromBookmarkView(showModalView: $showRemoveBookmarkView)
            CancelBookingView(showModalView: $showCancelBookingView)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
