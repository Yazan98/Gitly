//
//  PopularRepositoriesViewModel.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import SwiftUI

public final class PopularRepositoriesViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var repositoriesList: [GitlyRepository] = []
    
    private var isPaginationHasNextPage: Bool = false
    private var pageNumber: Int = 1
    private let repositoriesQueryManager = GitlyRepositoriesQueriesImplementation()
    
    public func getNextPageByIndex(index: Int) {
        if index == repositoriesList.count - 5 && isPaginationHasNextPage {
            repositoriesQueryManager.getPopularRepositories(pageNumber: pageNumber + 1) { list in
                self.pageNumber += 1
                self.isPaginationHasNextPage = list.isEmpty == false
                self.repositoriesList.append(contentsOf: list)
                self.isLoading = false
            }
        }
    }
    
    public func getScreenItems() {
        if repositoriesList.isEmpty {
            self.isLoading = true
        }
        
        repositoriesQueryManager.getPopularRepositories(
            pageNumber: pageNumber
        ) { list in
            self.isPaginationHasNextPage = list.isEmpty == false
            self.repositoriesList.append(contentsOf: list)
            self.isLoading = false
        }
    }
    
}
