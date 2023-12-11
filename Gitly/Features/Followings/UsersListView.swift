//
//  UsersListView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct UsersListView: View {
    
    let users: [UserEntity]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(users, id: \.self) { user in
                    Text("Placeholder Item")
                }
            }
        }
    }
}
