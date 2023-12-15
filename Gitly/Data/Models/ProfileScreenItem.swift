//
//  ProfileScreenItem.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation

public protocol ProfileScreenItem: Identifiable, Hashable {
    var id: String { get }
}

public struct ProfileScreenHeader: ProfileScreenItem {
    let name: String
    let bio: String
    public let id: String
    let status: String
    let image: String
    let location: String
    let website: String
    let isGithubDeveloperProgramEnabled: Bool
    let followersCount: Int
    let followingsCount: Int
    let starredRepositoriesCount: Int
    let repositoriesCount: Int
    let organizationsCount: Int
}

public struct ProfilePinnedRepositories: ProfileScreenItem {
    public var id: String = ""
    let repositories: [PinnedRepository]
}

public struct ProfileKeyValueItem: ProfileScreenItem {
    public var id: String = ""
    let iconName: String
    let name: String
    let value: Int
    let type: ProfileNavigationItem
    let userName: String
}

public enum ProfileNavigationItem {
    case Repositories
    case Organizations
    case StarredRepositories
}

public struct PinnedRepository: Hashable {
    let name: String
    let userName: String
    let id: String
    let description: String
    let stargazerCount: Int
    let forkCount: Int
}
