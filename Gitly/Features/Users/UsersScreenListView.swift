//
//  UsersScreenListView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct UsersScreenListView: View {
    
    @StateObject var viewModel: FollowingsViewModel = FollowingsViewModel()
    let followingType: FollowingsType
    let userName: String
    
    var body: some View {
        VStack {
            if viewModel.loadingState {
                ProgressView() .progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(Array(viewModel.usersList.enumerated()), id: \.1) { index, user in
                            NavigationLink(destination: EmptyView()) {
                                HStack(alignment: .top) {
                                    if let profileImage = URL(string: user.image) {
                                        ImageView(
                                            imageURL: profileImage,
                                            placeholder: Image(systemName: "photo"),
                                            width: 50,
                                            height: 50
                                        )
                                        .cornerRadius(90)
                                    }
                               
                                    VStack(alignment: .leading) {
                                        if user.name.isEmpty == false {
                                            Text(user.name)
                                                .font(.system(size: 20))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                        } else {
                                            Text(user.id)
                                                .font(.system(size: 20))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                        }
                                        
                                        Text(user.description)
                                            .foregroundColor(.gray)
                                            .lineLimit(3)
                                            .multilineTextAlignment(.leading)
                                    }
                                    .padding(.leading, 15)

                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .onAppear {
                                    viewModel.getNextPageByIndex(
                                        index: index,
                                        type: followingType,
                                        userName: userName
                                    )
                                }
                            }
                            .padding()
                    
                        }
                    }
                }
            }
        }
        .navigationTitle(followingType == .Followers ? "Followers" : "Followings")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getUsersByTypeWithUserName(type: followingType, userName: userName)
        }
    }
}
