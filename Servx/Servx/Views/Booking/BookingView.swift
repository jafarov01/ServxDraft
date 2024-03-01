//
//  BookingView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI
import MapKit

class TabSelection: ObservableObject {
    @Published var selectedTab: BookingView.Tab = .upcoming
}

struct BookingView: View {
    @EnvironmentObject var tabSelection: TabSelection
    @ObservedObject var authenticatedUser = AuthenticatedUser.shared
    
    enum Tab: String, CaseIterable {
        case upcoming
        case completed
        case cancelled
    }
    
    var body: some View {
        VStack {
            CustomTabBar(selectedTab: $tabSelection.selectedTab)
            
            TabView(selection: $tabSelection.selectedTab) {
                UpcomingBookingsView(bookings: authenticatedUser.bookedServices.filter { $0.Status == .ongoing })
                    .tag(Tab.upcoming)
                CompletedBookingsView(bookings: authenticatedUser.bookedServices.filter { $0.Status == .completed })
                    .tag(Tab.completed)
                CancelledBookingsView(bookings: authenticatedUser.bookedServices.filter { $0.Status == .cancelled })
                    .tag(Tab.cancelled)
            }
        }
    }
}

struct UpcomingBookingsView: View {
    var bookings: [Booking]
    
    var body: some View {
        ScrollView {
            ForEach(bookings, id: \.ID) { booking in
                SingleBookingPostView(booking: booking)
            }
        }
    }
}

struct CompletedBookingsView: View {
    var bookings: [Booking]
    
    var body: some View {
        ScrollView {
            ForEach(bookings, id: \.ID) { booking in
                SingleBookingPostView(booking: booking)
            }
        }
    }
}

struct CancelledBookingsView: View {
    var bookings: [Booking]
    
    var body: some View {
        ScrollView {
            ForEach(bookings, id: \.ID) { booking in
                SingleBookingPostView(booking: booking)
            }
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: BookingView.Tab
    
    var body: some View {
        HStack {
            ForEach(BookingView.Tab.allCases, id: \.self) { tab in
                Spacer()
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack(spacing: 0) {
                        Text(tab.rawValue.capitalized)
                            .font(.headline)
                            .foregroundColor(selectedTab == tab ? Color("primary500Color") : Color("greyscale700Color"))
                        if (selectedTab == tab) {
                            Rectangle()
                                .frame(width: 114, height: 3)
                                .background(selectedTab == tab ? Color("primary500Color") : Color.clear)
                        }
                    }
                }
                .padding(.vertical, 10)
                .cornerRadius(10)
                Spacer()
            }
        }
        .frame(height: 60)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    BookingView()
        .environmentObject(TabSelection())
}
