//
//  ProfileViewCell.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct ProfileViewCell: View {
    
    @State private var isFollowingsSheetShown = false
    @State private var isFollowersSheetShown = false
    let item: any ProfileScreenItem
    
    var body: some View {
        if item is ProfileScreenHeader {
            self.getHeaderView(item: item as! ProfileScreenHeader)
        } else if item is ProfileKeyValueItem {
            self.getKeyValueItem(item: item as! ProfileKeyValueItem)
        } else {
            self.getPinnedRepositories(item: item as! ProfilePinnedRepositories)
        }
    }
    
    private func getBackgroundColor() -> Color {
        let colors = [
            Color("GreenColor"),
            Color("OrangeColor"),
            Color("RedColor"),
            Color("PinkColor"),
        ]
        
        return colors[Int.random(in: 0...colors.count - 1)]
    }
    
    private func getPinnedRepositories(item: ProfilePinnedRepositories) -> some View {
        return VStack(alignment: .leading) {
            Text("Pinned Repositories")
                .padding(.top, 25)
                .padding(.leading, 15)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(item.repositories, id: \.self) { item in
                        ZStack(alignment: .top) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .shadow(radius: 3)
                                .frame(width: 250, height: 130)

                            VStack(alignment: .leading) {
                                HStack {
                                    Text(item.name)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                        .padding(.top, 12)
                                        .padding(.leading, 8)
                                        .padding(.bottom, 2)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                }

                                Text(item.description)
                                    .frame(width: 240, height: 48)
                                    .font(.caption2)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .padding(.leading, 2)
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                        .font(.caption2)
                                    
                                    Text("\(item.stargazerCount)")
                                        .padding(.leading, 1)
                                        .font(.caption2)
                                    
                                    Image(systemName: "paintbrush.pointed.fill")
                                        .font(.caption2)
                                        .padding(.leading, 20)
                                    
                                    Text("\(item.forkCount)")
                                        .padding(.leading, 1)
                                        .font(.caption2)
                                }
                                .padding(.top, 2)
                                .padding(.leading, 8)
                            }
                            .frame(width: 240)
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
        }
    }
    
    private func getKeyValueItem(item: ProfileKeyValueItem) -> some View {
        return HStack {
            HStack {
                Image(systemName: item.iconName)
                    .foregroundColor(.white)
                    .padding(5)
            }
            .background(self.getBackgroundColor())
            .cornerRadius(8)
            
            Text(item.name)
            Spacer()
            Text("\(item.value)")
        }
        .padding(.top, 7)
        .padding(.bottom, 7)
        .padding(.leading, 18)
        .padding(.trailing, 20)
    }
    
    private func getHeaderView(item: ProfileScreenHeader) -> some View {
        return VStack(alignment: .leading) {
            HStack(alignment: .top) {
                if let profileImage = URL(string: item.image) {
                    ImageView(
                        imageURL: profileImage,
                        placeholder: Image(systemName: "photo"),
                        width: 80,
                        height: 80
                    )
                    .cornerRadius(10)
                }
                                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(item.id)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 15)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            
            HStack {
                Text(item.status)
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(7)
                    .lineLimit(1)
                
                Spacer()
            }
            .background(Color("GreyColor"))
            .cornerRadius(8)
            .padding(3)
            
            Text(item.bio)
                .font(.caption)
            
            HStack {
                if item.location.isEmpty == false {
                    HStack {
                        Image(systemName: "location.fill")
                        Text(item.location).font(.caption)
                    }
                }
                
                if item.website.isEmpty == false {
                    HStack {
                        Image(systemName: "link")
                        Text(item.website).font(.caption)
                    }.padding(.leading, 10)
                }
            }
            .padding(.top, 10)
            
            if item.isGithubDeveloperProgramEnabled == true {
                HStack {
                    Image(systemName: "cpu")
                    Text("Developer Program Member").font(.caption)
                }
                .padding(.top, 10)
            }
            
            HStack {
                HStack {
                    Image(systemName: "person.3.fill")
                    Text("\(item.followingsCount) Following").font(.caption)
                }.sheet(isPresented: $isFollowingsSheetShown) {
                    FollowingsScreen(type: .Followings, userId: item.id)
                }
                .onTapGesture {
                    isFollowingsSheetShown = true
                }
                
                HStack {
                    Image(systemName: "person.fill")
                    Text("\(item.followersCount) Followers").font(.caption)
                }.padding(.leading, 10)
                    .sheet(isPresented: $isFollowersSheetShown) {
                        FollowingsScreen(type: .Followers, userId: item.id)
                    }
                    .onTapGesture {
                        isFollowersSheetShown = true
                    }
            }
            .padding(.top, 10)
        }
        .padding()
    }
}
