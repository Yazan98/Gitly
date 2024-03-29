//
//  RepositoriesListView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct RepositoriesListView: View {
    
    @StateObject var viewModel: RepositoriesViewModel = RepositoriesViewModel()
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
                            .padding()
                            .onAppear {
                                viewModel.getNextPageByIndex(index: index)
                            }
                    
                        }
                    }
                }
            }
        }
        .navigationTitle("Repositories")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getScreenItems(userName: userId)
        }
    }
}
