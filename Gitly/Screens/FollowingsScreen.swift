//
//  FollowingsScreen.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct FollowingsScreen: View {
    
    let type: FollowingsType
    let userId: String
    
    var body: some View {
        NavigationView {
            UsersScreenListView(followingType: type, userName: userId)
        }
        .accentColor(.black)
    }
}
