//
//  GitlyApiPaths.swift
//  Gitly
//
//  Created by Yazan Tarifi on 15/12/2023.
//

import Foundation

public enum GitlyApiPaths {
    case SearchApi
    
    public func getPaths() -> String {
        switch self {
        case .SearchApi:
            return "/search/repositories?q=stars:>1&sort=stars&order=desc&per_page=100"
        }
    }
}
