//
//  GitlyRepository.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import Foundation

public struct GitlyRepository: Hashable, Identifiable {
    public var id: String
    let name: String
    let description: String
    let languageName: String
    let languageColor: String
    let isPublic: Bool
    let starsCount: Int
    let forkCount: Int
    let issuesCount: Int
}
