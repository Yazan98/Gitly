//
//  OrgsViewModel.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import Foundation
import SwiftUI

public final class OrgsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var orgsList: [GitlyOrg] = []
    
    private let orgsImpl: GitlyOrgsQueriesImplementation = GitlyOrgsQueriesImplementation()
    
    public func getScreenItems(userName: String) {
        if userName.isEmpty {
            return
        }
        
        if orgsList.isEmpty {
            self.isLoading = true
        }
        
        orgsImpl.getOrgsList(
            userName: userName
        ) { list in
            DispatchQueue.main.async {
                self.orgsList.append(contentsOf: list)
                self.isLoading = false
            }
        }
    }
    
}
