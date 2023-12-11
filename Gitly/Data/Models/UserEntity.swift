//
//  UserEntity.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation

public struct UserEntity: Hashable, Identifiable {
    public var id: String
    let name: String
    let image: String
    let description: String
}
