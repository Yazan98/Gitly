//
//  GitlyUserQueriesImplementation.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation
import GithubGraphQlApi

protocol GitlyUserQueriesImplementationDescription {
    func getUserInformationByUserName(
        onAccountResult:  @escaping (GithubGraphQlApi.GetUserInformationByUserNameQuery.Data.User) -> Void,
        onAccountInvalid:  @escaping  () -> Void
    )
    
    func getFollowersUsersByUserName(
        userName: String,
        pageHash: String,
        onAccountResult:  @escaping ([UserEntity], String, Bool) -> Void
    )
    
    func getFollowingsUsersByUserName(
        userName: String,
        pageHash: String,
        onAccountResult:  @escaping ([UserEntity], String, Bool) -> Void
    )
    
    func getCurrentLoggedInUserInformation(onAccountResult:  @escaping (ProfileScreenHeader) -> Void)
}

public final class GitlyUserQueriesImplementation: GitlyUserQueriesImplementationDescription {
    
    
    func getUserInformationByUserName(
        onAccountResult:  @escaping (GithubGraphQlApi.GetUserInformationByUserNameQuery.Data.User) -> Void,
        onAccountInvalid:  @escaping () -> Void
    ) {
        let userName = GitlyStorageKeysManager.shared.getUserNameValue()
        GitlyApiManager.shared.getApiInstance().fetch(
            query: GetUserInformationByUserNameQuery(userName: userName)
        ) { result in
            guard let data = try? result.get().data else { 
                onAccountInvalid()
                GitlyStorageKeysManager.shared.onInsertLoginInformation(username: "", token: "")
                return
            }
            
            guard let userInfo = data.user else {
                onAccountInvalid()
                GitlyStorageKeysManager.shared.onInsertLoginInformation(username: "", token: "")
                return
            }
            
            onAccountResult(userInfo)
        }
    }
    
    func getCurrentLoggedInUserInformation(
        onAccountResult:  @escaping (ProfileScreenHeader) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            let userName = GitlyStorageKeysManager.shared.getUserNameValue()
            GitlyApiManager.shared.getApiInstance().fetch(
                query: GetUserInformationByUserNameQuery(userName: userName)
            ) { result in
                guard let data = try? result.get().data else { return }
                guard let userInfo = data.user else { return }
                
                let profileHeader = ProfileScreenHeader(
                    name: userInfo.name ?? "",
                    bio: userInfo.bio ?? "",
                    id: userInfo.login,
                    status: userInfo.status?.message ?? "",
                    image: userInfo.avatarUrl,
                    location: userInfo.location ?? "",
                    website: userInfo.websiteUrl ?? "",
                    isGithubDeveloperProgramEnabled: userInfo.isDeveloperProgramMember,
                    followersCount: userInfo.followers.totalCount ,
                    followingsCount: userInfo.following.totalCount,
                    starredRepositoriesCount: userInfo.starredRepositories.totalCount,
                    repositoriesCount: userInfo.repositories.totalCount,
                    organizationsCount: userInfo.organizations.totalCount
                )
                
                onAccountResult(profileHeader)
            }
        }
    }
    
    func getFollowersUsersByUserName(
        userName: String,
        pageHash: String,
        onAccountResult:  @escaping ([UserEntity], String, Bool) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            if pageHash.isEmpty {
                GitlyApiManager.shared.getApiInstance().fetch(
                    query: GetFollowersFirstPageQuery(id: userName)
                ) { result in
                    guard let data = try? result.get().data else { return }
                    guard let userInfo = data.user else { return }
                    var users: [UserEntity] = []
                    
                    userInfo.followers.edges?.forEach { user in
                        users.append(UserEntity(
                            id: user?.node?.login ?? "",
                            name: user?.node?.name ?? "",
                            image: user?.node?.avatarUrl ?? "",
                            description: user?.node?.bio ?? ""
                        ))
                    }
                    
                    onAccountResult(
                        users,
                        userInfo.followers.pageInfo.endCursor ?? "",
                        userInfo.followers.pageInfo.hasNextPage
                    )
                }
                return
            }

            GitlyApiManager.shared.getApiInstance().fetch(
                query: GetFollowersByUserNameQuery(id: userName, pageId: pageHash)
            ) { result in
                guard let data = try? result.get().data else { return }
                guard let userInfo = data.user else { return }
                var users: [UserEntity] = []
                
                userInfo.followers.edges?.forEach { user in
                    users.append(UserEntity(
                        id: user?.node?.login ?? "",
                        name: user?.node?.name ?? "",
                        image: user?.node?.avatarUrl ?? "",
                        description: user?.node?.bio ?? ""
                    ))
                }
                
                onAccountResult(
                    users,
                    userInfo.followers.pageInfo.endCursor ?? "",
                    userInfo.followers.pageInfo.hasNextPage
                )
            }
        }
    }
    
    func getFollowingsUsersByUserName(
        userName: String,
        pageHash: String,
        onAccountResult: @escaping ([UserEntity], String, Bool) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            if pageHash.isEmpty {
                GitlyApiManager.shared.getApiInstance().fetch(
                    query: GetFollowingsFirstPageQuery(id: userName)
                ) { result in
                    guard let data = try? result.get().data else { return }
                    guard let userInfo = data.user else { return }
                    var users: [UserEntity] = []
                    
                    userInfo.following.edges?.forEach { user in
                        users.append(UserEntity(
                            id: user?.node?.login ?? "",
                            name: user?.node?.name ?? "",
                            image: user?.node?.avatarUrl ?? "",
                            description: user?.node?.bio ?? ""
                        ))
                    }
                    
                    onAccountResult(
                        users,
                        userInfo.following.pageInfo.endCursor ?? "",
                        userInfo.following.pageInfo.hasNextPage
                    )
                }
                return
            }

            GitlyApiManager.shared.getApiInstance().fetch(
                query: GetFollowingsByUserNameQuery(id: userName, pageId: pageHash)
            ) { result in
                guard let data = try? result.get().data else { return }
                guard let userInfo = data.user else { return }
                var users: [UserEntity] = []
                
                userInfo.following.edges?.forEach { user in
                    users.append(UserEntity(
                        id: user?.node?.login ?? "",
                        name: user?.node?.name ?? "",
                        image: user?.node?.avatarUrl ?? "",
                        description: user?.node?.bio ?? ""
                    ))
                }
                
                onAccountResult(
                    users,
                    userInfo.following.pageInfo.endCursor ?? "",
                    userInfo.following.pageInfo.hasNextPage
                )
            }
        }
    }
    
}
