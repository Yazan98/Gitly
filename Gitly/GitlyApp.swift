//
//  GitlyApp.swift
//  Gitly
//
//  Created by Yazan Tarifi on 09/12/2023.
//

import SwiftUI
import SwiftData

@main
struct GitlyApp: App {
    
    @State var onNavigationDirectly = false
    let isUserLoggedIn = GitlyStorageKeysManager.shared.isUserLoggedIn()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isUserLoggedIn {
                    LoginScreen()
                } else {
                    OnBoardingScreen(onLoginScreenDirection: $onNavigationDirectly)
                }
            }
        }
    }
}
