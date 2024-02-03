//
//  BersinarTabView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 22/10/23.
//

import SwiftUI

struct BersinarTabView: View {
    @State private var selectedTab = 0
    @State private var showSignInView: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // MARK: - Homepage
            HomepageView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            // MARK: - Donate
            DonationView()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "wallet.pass.fill" : "wallet.pass")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            // MARK: - Profile
            ProfileView(showSignInView: $showSignInView)
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
        }
        .tint(.primary70)
    }
}

struct BersinarTabView_Previews: PreviewProvider {
    static var previews: some View {
        BersinarTabView()
    }
}
