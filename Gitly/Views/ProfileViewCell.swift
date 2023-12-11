//
//  ProfileViewCell.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct ProfileViewCell: View {
    
    let item: any ProfileScreenItem
    
    var body: some View {
        if item is ProfileScreenHeader {
            self.getHeaderView(item: item as! ProfileScreenHeader)
        } else if item is ProfileKeyValueItem {
            self.getKeyValueItem(item: item as! ProfileKeyValueItem)
        } else {
            Text("Item")
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
                }
                
                HStack {
                    Image(systemName: "person.fill")
                    Text("\(item.followersCount) Followers").font(.caption)
                }.padding(.leading, 10)
            }
            .padding(.top, 10)
        }
        .padding()
    }
}
