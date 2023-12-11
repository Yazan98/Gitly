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
}

public final class GitlyUserQueriesImplementation: GitlyUserQueriesImplementationDescription {
    
    func getUserInformationByUserName(onAccountResult:  @escaping (GithubGraphQlApi.GetUserInformationByUserNameQuery.Data.User) -> Void, onAccountInvalid:  @escaping () -> Void) {
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
            
            print("Login Response :: \(userInfo)")
            onAccountResult(userInfo)
        }
    }
    
}
