//
//  GitlyRepositoriesQueriesImplementation.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation
import GithubGraphQlApi

private protocol GitlyRepositoriesQueriesImplementationDescription {
    func getPinnedRepositoriesByUserName(
        userName: String,
        onRepositories: @escaping (ProfilePinnedRepositories) -> Void
    )
    
    func getPinnedRepositoriesByCurrentUser(
        onRepositories: @escaping (ProfilePinnedRepositories) -> Void
    )
}

public final class GitlyRepositoriesQueriesImplementation: GitlyRepositoriesQueriesImplementationDescription {
    
    func getPinnedRepositoriesByUserName(userName: String, onRepositories: @escaping (ProfilePinnedRepositories) -> Void) {
        DispatchQueue.global(qos: .background).async {
            GitlyApiManager.shared.getApiInstance().fetch(
                query: PinnedRepositoriesQuery(userName: userName)
            ) { response in
                guard let data = try? response.get().data else { return }
                guard let repositoriesResponse = data.user else { return }
                var repositories: [PinnedRepository] = []
                repositoriesResponse.pinnedItems.nodes?.forEach { responseRepository in
                    let repository = PinnedRepository(
                        name: responseRepository?.asRepository?.name ?? "",
                        userName: userName,
                        id: responseRepository?.asRepository?.id ?? "",
                        description: responseRepository?.asRepository?.description ?? "",
                        stargazerCount: responseRepository?.asRepository?.stargazerCount ?? 0,
                        forkCount: responseRepository?.asRepository?.forkCount ?? 0
                    )
                    
                    repositories.append(repository)
                }
                
                onRepositories(ProfilePinnedRepositories(repositories: repositories))
            }
        }
    }
    
    func getPinnedRepositoriesByCurrentUser(onRepositories: @escaping (ProfilePinnedRepositories) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let userName = GitlyStorageKeysManager.shared.getUserNameValue()
            GitlyApiManager.shared.getApiInstance().fetch(
                query: PinnedRepositoriesQuery(userName: userName)
            ) { response in
                guard let data = try? response.get().data else { return }
                guard let repositoriesResponse = data.user else { return }
                var repositories: [PinnedRepository] = []
                repositoriesResponse.pinnedItems.nodes?.forEach { responseRepository in
                    let repository = PinnedRepository(
                        name: responseRepository?.asRepository?.name ?? "",
                        userName: userName,
                        id: responseRepository?.asRepository?.id ?? "",
                        description: responseRepository?.asRepository?.description ?? "",
                        stargazerCount: responseRepository?.asRepository?.stargazerCount ?? 0,
                        forkCount: responseRepository?.asRepository?.forkCount ?? 0
                    )
                    
                    repositories.append(repository)
                }
                
                onRepositories(ProfilePinnedRepositories(repositories: repositories))
            }
        }
    }
    
    public func getRepositoriesByUserName(
        userName: String,
        paginationHash: String,
        onResponse: @escaping ([GitlyRepository], Bool, String) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            if paginationHash.isEmpty {
                GitlyApiManager.shared.getApiInstance().fetch(
                    query: GetFirstPageRepositoriesQuery(id: userName)
                ) { response in
                    guard let data = try? response.get().data else { return }
                    guard let repositoriesResponse = data.user else { return }
                    var repositoriesResult: [GitlyRepository] = []
                    repositoriesResponse.repositories.nodes?.forEach { repository in
                        repositoriesResult.append(self.getRepositoryItem(item: repository))
                    }
                    
                    onResponse(
                        repositoriesResult,
                        repositoriesResponse.repositories.pageInfo.hasNextPage ,
                        repositoriesResponse.repositories.pageInfo.endCursor ?? ""
                    )
                }
                
                return
            }
            
            GitlyApiManager.shared.getApiInstance().fetch(
                query: GetRepositoriesByPageHashQuery(id: userName, pageHash: paginationHash)
            ) { response in
                guard let data = try? response.get().data else { return }
                guard let repositoriesResponse = data.user else { return }
                var repositoriesResult: [GitlyRepository] = []
                repositoriesResponse.repositories.nodes?.forEach { repository in
                    repositoriesResult.append(self.getRepositoryItem(item: repository))
                }
                
                onResponse(
                    repositoriesResult,
                    repositoriesResponse.repositories.pageInfo.hasNextPage ,
                    repositoriesResponse.repositories.pageInfo.endCursor ?? ""
                )
            }
        }
    }
    
    private func getRepositoryItem(
        item: GetFirstPageRepositoriesQuery.Data.User.Repositories.Node?
    ) -> GitlyRepository {
        return GitlyRepository(
            id: item?.id ?? "",
            name: item?.name ?? "",
            description: item?.description ?? "",
            languageName: item?.primaryLanguage?.name ?? "",
            languageColor: item?.primaryLanguage?.color ?? "",
            isPublic: item?.visibility.rawValue == "PUBLIC",
            starsCount: item?.stargazerCount ?? 0,
            forkCount: item?.forkCount ?? 0,
            issuesCount: item?.issues.totalCount ?? 0
        )
    }
    
    private func getRepositoryItem(
        item: GetRepositoriesByPageHashQuery.Data.User.Repositories.Node?
    ) -> GitlyRepository {
        return GitlyRepository(
            id: item?.id ?? "",
            name: item?.name ?? "",
            description: item?.description ?? "",
            languageName: item?.primaryLanguage?.name ?? "",
            languageColor: item?.primaryLanguage?.color ?? "",
            isPublic: item?.visibility.rawValue == "PUBLIC",
            starsCount: item?.stargazerCount ?? 0,
            forkCount: item?.forkCount ?? 0,
            issuesCount: item?.issues.totalCount ?? 0
        )
    }
    
}
