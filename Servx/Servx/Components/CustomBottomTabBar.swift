//
//  CustomTabBar.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case booking
    case calendar
    case inbox
    case profile
}

var tabViews: [Tab: AnyView] = [
    .home: AnyView(HomeView()),
    .booking: AnyView(BookingView().environmentObject(TabSelection())),
    .calendar: AnyView(CalendarView()),
    .inbox: AnyView(InboxView()),
    .profile: AnyView(UserProfileView())
]

struct CustomBottomTabBar: View {
    @Binding var selectedTab: Tab

    private var activeImage: String {
        return selectedTab.rawValue + "Active"
    }

    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Image((selectedTab == tab ? activeImage : tab.rawValue + "Inactive"))
                    .frame(width: 36, height: 36)
                    .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                    .font(.system(size: 22))
                    .padding(.bottom, 10)
                    .onTapGesture{
                        withAnimation(.easeIn(duration: 0.5)) {
                            selectedTab = tab
                        }
                    }
                Spacer()
            }
        }
        .frame(width: nil, height: 70) // Set height explicitly
        .background(.thinMaterial) // Use Color instead of .thinMaterial
        .cornerRadius(10)
    }
    
}

#Preview {
    MainBottomNavBar()
}
