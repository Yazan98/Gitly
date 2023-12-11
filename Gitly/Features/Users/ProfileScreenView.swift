//
//  ProfileScreenView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct ProfileScreenView: View {
    
    @StateObject private var profileViewModel: ProfileViewModel = ProfileViewModel()
    let userName: String
    let userId: String
    
    var body: some View {
        VStack {
            if profileViewModel.loadingState {
                ProgressView() .progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(0..<profileViewModel.screenItems.count) { index in
                            ProfileViewCell(item: profileViewModel.screenItems[index])
                        }
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle(userName.isEmpty == false ? userName : userId)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            profileViewModel.getProfileInformationByUserName(userName: userId)
        }
    }
}

