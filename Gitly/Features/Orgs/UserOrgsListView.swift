//
//  UserOrgsListView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import SwiftUI

struct UserOrgsListView: View {
    
    @StateObject private var viewModel: OrgsViewModel = OrgsViewModel()
    let userName: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(Array(viewModel.orgsList.enumerated()), id: \.1) { index, org in
                            NavigationLink(destination: EmptyView()) {
                                HStack {
                                    if let profileImage = URL(string: org.image) {
                                        ImageView(
                                            imageURL: profileImage,
                                            placeholder: Image(systemName: "photo"),
                                            width: 60,
                                            height: 60
                                        )
                                        .cornerRadius(10)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Text(org.name)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.leading)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            if org.description.isEmpty {
                                                Text(org.userName)
                                                    .font(.title3)
                                                    .multilineTextAlignment(.leading)
                                            } else {
                                                Text(org.description)
                                                    .font(.caption)
                                                    .multilineTextAlignment(.leading)
                                            }
                                            
                                            Spacer()
                                        }
                                    }
                                    .padding(.leading, 3)
                                    
                                    Spacer()
                                }
                            }
                            .padding()
                    
                        }
                    }
                }
            }
        }
        .navigationTitle("Organizations")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getScreenItems(userName: userName)
        }
    }
}
