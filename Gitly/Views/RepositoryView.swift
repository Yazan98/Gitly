//
//  RepositoryView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import SwiftUI

struct RepositoryView: View {
    
    let repository: GitlyRepository
    
    var body: some View {
        VStack {
            HStack {
                Text(repository.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            HStack {
                Text(repository.description)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 2)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "star.fill")
                Text("\(repository.starsCount)")
                    .font(.caption2)
                    .padding(.leading, 2)
                
                Image(systemName: "tuningfork")
                    .padding(.leading, 4)
                
                Text("\(repository.forkCount)")
                    .font(.caption2)
                    .padding(.leading, 2)
                
                if repository.languageColor.isEmpty == false {
                    Circle()
                        .foregroundColor(Color(hex: repository.languageColor))
                        .padding(.leading, 4)
                        .frame(width: 20, height: 20)
                    
                    Text(repository.languageName)
                        .font(.caption2)
                        .padding(.leading, 2)
                }
                
                Spacer()
                
            }
            .padding(.top, 2)
            
        }
    }
}
