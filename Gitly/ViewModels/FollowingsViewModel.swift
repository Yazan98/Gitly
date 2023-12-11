//
//  FollowingsViewModel.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation

public class FollowingsViewModel : ObservableObject {
    
    @Published var usersList: [UserEntity] = []
    @Published var loadingState: Bool = false
    
    private var isNextPageLoading: Bool = false
    private var isPaginationHasNextPage: Bool = false
    private var nextPageHash: String = ""
    private let usersRepository: GitlyUserQueriesImplementation = GitlyUserQueriesImplementation()
    
    public func getNextPageByIndex(index: Int, type: FollowingsType, userName: String) {
        if index >= usersList.count - 5 {
            self.getUsersByTypeWithUserName(type: type, userName: userName)
        }
    }
    
    public func getUsersByTypeWithUserName(type: FollowingsType, userName: String) {
        if usersList.isEmpty {
            self.loadingState = true
        }
        
        if usersList.isEmpty == false && isPaginationHasNextPage == false {
            return
        }
        
        if isNextPageLoading {
            return
        }

        self.isNextPageLoading = true
        switch (type) {
        case .Followers:
            self.getFollowersByUserName(userName: userName)
            break
        case .Followings:
            self.getFollowingsByUserName(userName: userName)
            break
        }
    }
    
    private func getFollowersByUserName(userName: String) {
        usersRepository.getFollowersUsersByUserName(
            userName: userName,
            pageHash: nextPageHash
        ) { users, nextPageHashResult, isNextPageAvailable in
            DispatchQueue.main.async {
                self.isNextPageLoading = false
                self.isPaginationHasNextPage = isNextPageAvailable
                self.nextPageHash = nextPageHashResult
                self.usersList.append(contentsOf: users)
                if self.loadingState {
                    self.loadingState = false
                }
            }
        }
    }
    
    private func getFollowingsByUserName(userName: String) {
        usersRepository.getFollowingsUsersByUserName(
            userName: userName,
            pageHash: nextPageHash
        ) { users, nextPageHashResult, isNextPageAvailable in
            DispatchQueue.main.async {
                self.isNextPageLoading = false
                self.isPaginationHasNextPage = isNextPageAvailable
                self.nextPageHash = nextPageHashResult
                self.usersList.append(contentsOf: users)
                if self.loadingState {
                    self.loadingState = false
                }
            }
        }
    }
    
}
