//
//  ProfileTabView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct ProfileTabView: View {
    
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            if viewModel.loadingState {
                ProgressView() .progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(0..<viewModel.screenItems.count) { index in
                            ProfileViewCell(item: viewModel.screenItems[index])
                        }
                    }
                }
                
                Spacer()
            }
        }
        .clipped()
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getProfileInformation()
        }
    }
}
