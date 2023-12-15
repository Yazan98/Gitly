//
//  PopularRepositoriesResponse.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import Foundation

public struct PopularRepositoriesResponse: Decodable, Encodable {
    let items: [RepositoryItem]
}

public struct RepositoryItem: Decodable, Encodable, Identifiable {
    public var id: Int64
    let name: String
    let full_name: String
    let description: String?
    let stargazers_count: Int
    let forks_count: Int
    let visibility: String?
    let topics: [String]?
    let owner: RepositoryOwner
}

public struct RepositoryOwner: Decodable, Encodable {
    let login: String
    let avatar_url: String
}
