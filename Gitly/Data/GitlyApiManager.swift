//
//  GitlyApiManager.swift
//  Gitly
//
//  Created by Yazan Tarifi on 10/12/2023.
//

import Foundation
import Apollo
import ApolloAPI

public class GitlyApiManager {
    
    private static let GITHUB_BASE_URL = "https://api.github.com/graphql"
    public static let shared = GitlyApiManager()
    
    func getApiInstance() -> ApolloClient {
          let cache = InMemoryNormalizedCache()
          let store = ApolloStore(cache: cache)

          let client = URLSessionClient()
          let provider = NetworkInterceptorProvider(store: store, client: client)
          let applicationUrl = URL(string: GitlyApiManager.GITHUB_BASE_URL)!

          let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: applicationUrl
          )

          return ApolloClient(networkTransport: requestChainTransport, store: store)
    }
    
}

struct NetworkInterceptorProvider: InterceptorProvider {

  private let store: ApolloStore
  private let client: URLSessionClient

  init(store: ApolloStore, client: URLSessionClient) {
    self.store = store
    self.client = client
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    return [
      MaxRetryInterceptor(),
      CacheReadInterceptor(store: self.store),
      UserManagementInterceptor(),
      NetworkFetchInterceptor(client: self.client),
      ResponseCodeInterceptor(),
      JSONResponseParsingInterceptor(),
      AutomaticPersistedQueryInterceptor(),
      CacheWriteInterceptor(store: self.store)
    ]
  }
}

class UserManagementInterceptor: ApolloInterceptor {
    
    public var id: String = UUID().uuidString

    func interceptAsync<Operation>(chain: Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
        let token = GitlyStorageKeysManager.shared.getUserTokenValue()
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        chain.proceedAsync(
          request: request,
          response: response,
          interceptor: self,
          completion: completion
        )
    }
}
