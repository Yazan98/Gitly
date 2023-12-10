//
//  GitlyStorageKeysManager.swift
//  Gitly
//
//  Created by Yazan Tarifi on 10/12/2023.
//

import Foundation

public final class GitlyStorageKeysManager {
    static let shared = GitlyStorageKeysManager()
    
    private let githubUserNameKey = "GITHUB_USERNAME"
    private let githubUserTokenKey = "GITHUB_TOKEN"
    
    public func onInsertLoginInformation(username: String, token: String) {
        UserDefaults.standard.set(username, forKey: githubUserNameKey)
        UserDefaults.standard.set(token, forKey: githubUserTokenKey)
    }
    
    public func isUserLoggedIn() -> Bool {
        return getUserNameValue().isEmpty == false
    }
    
    public func getUserNameValue() -> String {
        return UserDefaults.standard.string(forKey: githubUserNameKey) ?? ""
    }
    
    public func getUserTokenValue() -> String {
        return UserDefaults.standard.string(forKey: githubUserTokenKey) ?? ""
    }
}
