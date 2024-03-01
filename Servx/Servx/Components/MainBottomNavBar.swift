//
//  HomePageView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI

struct MainBottomNavBar: View {
    @State private var selectedTab : Tab = .home
    @ObservedObject var viewModel = HomeViewViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        tabViews[tab]
                            .tag(tab)
                    }
                    .padding(.bottom, 40)
                    .animation(nil, value: selectedTab)
                }
            }
            
            VStack {
                Spacer()
                CustomBottomTabBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    MainBottomNavBar()
}
