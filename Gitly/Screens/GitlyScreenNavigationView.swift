//
//  GitlyScreenNavigationView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import SwiftUI

struct GitlyScreenNavigationView: View {
    
    let navigation: GitlyScreenNavigationItem
    
    var body: some View {
        NavigationView {
            switch navigation {
            case .Home: 
                HomeScreen()
            }
        }
    }
}
