//
//  ExploreTabView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct ExploreTabView: View {
    
    @ObservedObject var viewModel: PopularRepositoriesViewModel
    
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
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.getScreenItems()
        }
    }
}
