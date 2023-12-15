//
//  RepositoriesViewModel.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation
import SwiftUI

public final class RepositoriesViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var repositoriesList: [GitlyRepository] = []
    
    private var currentUserName: String = ""
    private var isPaginationHasNextPage: Bool = false
    private var nextPaginationHash: String = ""
    private let repositoriesQueryManager = GitlyRepositoriesQueriesImplementation()
    
    public func getNextPageByIndex(index: Int) {
        if index == repositoriesList.count - 5 && isPaginationHasNextPage {
            repositoriesQueryManager.getRepositoriesByUserName(
                userName: currentUserName,
                paginationHash: nextPaginationHash
            ) { list, isHasNextPage, nextPageHashResponse in
                DispatchQueue.main.async {
                    self.nextPaginationHash = nextPageHashResponse
                    self.isPaginationHasNextPage = isHasNextPage
                    self.repositoriesList.append(contentsOf: list)
                    self.isLoading = false
                }
            }
        }
    }
    
    public func getScreenItems(userName: String) {
        self.currentUserName = userName
        if userName.isEmpty {
            return
        }
        
        if repositoriesList.isEmpty {
            self.isLoading = true
        }
        
        repositoriesQueryManager.getRepositoriesByUserName(
            userName: userName,
            paginationHash: nextPaginationHash
        ) { list, isHasNextPage, nextPageHashResponse in
            DispatchQueue.main.async {
                self.nextPaginationHash = nextPageHashResponse
                self.isPaginationHasNextPage = isHasNextPage
                self.repositoriesList.append(contentsOf: list)
                self.isLoading = false
            }
        }
    }
    
}
