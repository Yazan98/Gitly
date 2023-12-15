//
//  StarredRepositoriesListView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import SwiftUI

struct StarredRepositoriesListView: View {
    
    @StateObject var viewModel: StarredRepositoriesViewModel = StarredRepositoriesViewModel()
    let userId: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(Array(viewModel.repositoriesList.enumerated()), id: \.1) { index, repository in
                            RepositoryView(repository: repository)
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                viewModel.getNextPageByIndex(index: index)
                            }
                            .padding()
                    
                        }
                    }
                }
            }
        }
        .navigationTitle("Starred Repositories")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getScreenItems(userName: userId)
        }
    }
}
