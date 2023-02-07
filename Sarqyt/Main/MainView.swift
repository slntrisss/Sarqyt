//
//  MainView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 04.02.2023.
//

import SwiftUI

struct MainView: View {
    @State private var showRemoveBookmarkView = false
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
            RemoveFromBookmarkView(showModalView: $showRemoveBookmarkView)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
