//
//  ProfileViewModel.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation

public final class ProfileViewModel: ObservableObject {
    
    @Published var loadingState: Bool = false
    @Published var screenItems: [any ProfileScreenItem] = []
    
    private let profileRepository: GitlyUserQueriesImplementation = GitlyUserQueriesImplementation()
    private let repositoriesQueryImpl: GitlyRepositoriesQueriesImplementation = GitlyRepositoriesQueriesImplementation()
    
    
    public func getProfileInformation() {
        if screenItems.isEmpty == false {
            return
        }
        
        loadingState = true
        profileRepository.getCurrentLoggedInUserInformation { userInfo in
            self.getPinnedRepositories(userInfo: userInfo)
        }
    }
    
    private func getPinnedRepositories(userInfo: ProfileScreenHeader) {
        repositoriesQueryImpl.getPinnedRepositoriesByCurrentUser { repositories in
            var screenContent: [any ProfileScreenItem] = []
            
            screenContent.append(userInfo)
            screenContent.append(contentsOf: self.getKeyValueItemsByProfileItem(profile: userInfo))
            screenContent.append(repositories)
            
            DispatchQueue.main.async {
                self.loadingState = false
                self.screenItems = screenContent
            }
        }
    }
    
    private func getKeyValueItemsByProfileItem(profile: ProfileScreenHeader) -> [any ProfileScreenItem] {
        return [
            ProfileKeyValueItem(iconName: "book.pages.fill", name: "Repositories", value: profile.repositoriesCount),
            ProfileKeyValueItem(iconName: "star.fill", name: "Starred", value: profile.starredRepositoriesCount),
            ProfileKeyValueItem(iconName: "building.2", name: "Organizations", value: profile.organizationsCount),
        ]
    }
}
