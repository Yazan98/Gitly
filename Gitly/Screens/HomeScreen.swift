//
//  HomeScreen.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var profileViewModel = ProfileViewModel()
    
    var body: some View {
        TabView {
            HomeTabView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationView {
                NotificationsTabView()
            }.tabItem {
                Label("Notifications", systemImage: "paperplane.fill")
            }
            
            NavigationView {
                ExploreTabView()
            }.tabItem {
                Label("Explore", systemImage: "flag.2.crossed.fill")
            }
            
            NavigationView {
                ProfileTabView(viewModel: profileViewModel)
            }.tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
        }.accentColor(.black)
    }
}
