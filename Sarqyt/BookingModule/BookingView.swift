//
//  BookingView.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 04.02.2023.
//

import SwiftUI

struct BookingView: View {
    @State private var searchQuery = ""
    @State private var ongoingButtonTapped = false
    @State private var completedButtonTapped = false
    @State private var canceledButtonTapped = true
    
    @State private var navigateToCancelBookingView = false
    
    private let canceledRestaurants = ["Palms Casino Resort", "The Mark Hotel", "Palazzo Versace Dubai", "Hotel Martinez", "Abraham St. Jones"]
    private let canceledRestaurantAddresses = ["London, UK", "Luxemburg, Germany", "Dubai, United Arab Emirates", "Amsterdam, Netherlands", "New York, USA"]
    private let status = BookingStatus.ongoing
    private let canceledRestaurantDescription = "You canceled his hotel booking"
    
    private let completedRestaurants = ["Bulgari Resort", "The Mark Hotel", "Palazzo Versace Dubai", "Hotel Martinez", "Abraham St. Jones"]
    private let completedRestaurantAddresses = ["Paris, France", "Luxemburg, Germany", "Dubai, United Arab Emirates", "Amsterdam, Netherlands", "New York, USA"]
    private let completedRestaurantDescription = "Yeay, you have completed it!"
    
    private let ongoingRestaurants = ["Palms Casino Resort", "The Mark Hotel", "Palazzo Versace Dubai", "Hotel Martinez", "Abraham St. Jones"]
    private let ongoingRestaurantAddresses = ["London, UK", "Luxemburg, Germany", "Dubai, United Arab Emirates", "Amsterdam, Netherlands", "New York, USA"]
    private let ongoingRestaurantDescription = "You canceled his hotel booking"
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    HistoryButton(title: "Ongoing", tapped: $ongoingButtonTapped)
                        .onChange(of: ongoingButtonTapped) { _ in
                            if ongoingButtonTapped{
                                completedButtonTapped = false
                                canceledButtonTapped = false
                            }
                        }
                    HistoryButton(title: "Completed", tapped: $completedButtonTapped)
                        .onChange(of: completedButtonTapped) { _ in
                            if completedButtonTapped{
                                ongoingButtonTapped = false
                                canceledButtonTapped = false
                            }
                        }
                    HistoryButton(title: "Canceled", tapped: $canceledButtonTapped)
                        .onChange(of: canceledButtonTapped) { _ in
                            if canceledButtonTapped{
                                completedButtonTapped = false
                                ongoingButtonTapped = false
                            }
                        }
                }
                .padding(.bottom, 30)
                
                if ongoingButtonTapped{
                    ForEach(0..<5, id: \.self){ index in
                        VStack{
                            HistoryRestaurantCardView(restaurantName: ongoingRestaurants[index], address: ongoingRestaurantAddresses[index], status: .ongoing)
                            HistoryRestaurantCardButtons()
                        }
                        .historyRestaurantCardBackground()
                    }
                }else if completedButtonTapped{
                    ForEach(0..<5, id: \.self){ index in
                        VStack{
                            HistoryRestaurantCardView(restaurantName: completedRestaurants[index], address: completedRestaurantAddresses[index], status: .completed)
                            HistoryRestaurantCardDescriptionView(status: .completed, description: completedRestaurantDescription)
                        }
                        .historyRestaurantCardBackground()
                    }
                }else{
                    ForEach(0..<5, id: \.self){ index in
                        VStack{
                            HistoryRestaurantCardView(restaurantName: canceledRestaurants[index], address: canceledRestaurantAddresses[index], status: .canceled)
                            HistoryRestaurantCardDescriptionView(status: .canceled, description: canceledRestaurantDescription)
                        }
                        .historyRestaurantCardBackground()
                    }
                }
                
                NavigationLink(isActive: $navigateToCancelBookingView) {
                    CancelBookingView()
                } label: {
                    EmptyView()
                }

            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.ShowCancelBookingViewButtonTapped), perform: { _ in
                navigateToCancelBookingView = true
            })
            .searchable(text: $searchQuery)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                        Text("My Booking")
                            .font(.title.weight(.semibold))
                        Spacer()
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .padding(.horizontal)
    }
    
    enum BookingStatus: String{
        case ongoing = "Paid", completed = "Completed", canceled = "Canceled & Refunded"
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BookingView()
        }
        .preferredColorScheme(.dark)
    }
}
