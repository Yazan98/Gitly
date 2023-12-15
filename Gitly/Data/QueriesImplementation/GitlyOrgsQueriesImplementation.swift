//
//  GitlyOrgsQueriesImplementation.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import Foundation
import ApolloAPI
import Apollo
import GithubGraphQlApi

public final class GitlyOrgsQueriesImplementation {
    
    func getOrgsList(
        userName: String,
        onResult: @escaping ([GitlyOrg]) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            GitlyApiManager.shared.getApiInstance().fetch(
                query: GetOrganizationsByCurrentLoggedInUserQuery(id: userName)
            ) { result in
                guard let data = try? result.get().data else { return }
                guard let userInfo = data.user else { return }
                var orgs: [GitlyOrg] = []
                userInfo.organizations.nodes?.forEach { org in
                    orgs.append(GitlyOrg(
                        id: org?.id ?? "",
                        name: org?.name ?? "",
                        userName: org?.login ?? "",
                        description: org?.description ?? "",
                        image: org?.avatarUrl ?? ""
                    ))
                }
                
                onResult(orgs)
            }
        }
    }
    
}
