//
//  GitlyApiManager.swift
//  Gitly
//
//  Created by Yazan Tarifi on 10/12/2023.
//

import Foundation
import Apollo
import ApolloAPI
import Alamofire

public class GitlyApiManager {
    
    public static let API_BASE_URL = "https://api.github.com"
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
    
    public func onGetApiContent<Response: Codable>(
        requestUrl: String,
        responseType: [Response].Type,
        onSuccessResponse: @escaping ([Response]) -> Void,
        onErrorResponse: @escaping (Error) -> Void
    ) {
            DispatchQueue.global(qos: .background).async {
                let apiBaseUrl = GitlyApiManager.API_BASE_URL
                GitlyApiManager.apiManager.request(
                    apiBaseUrl + requestUrl,
                    method: .get
                ).responseDecodable(of: responseType.self) { response in
                    DispatchQueue.main.async {
                        switch response.result {
                        case .success(let response):
                            onSuccessResponse(response)
                        case .failure(let error):
                            onErrorResponse(error)
                        }
                    }
                }
            }
    }
    
    
    public func onGetApiContent<Response: Codable>(
        requestUrl: String,
        responseType: Response.Type,
        onSuccessResponse: @escaping (Response) -> Void,
        onErrorResponse: @escaping (Error) -> Void
    ) {
            DispatchQueue.global(qos: .background).async {
                let apiBaseUrl = GitlyApiManager.API_BASE_URL
                GitlyApiManager.apiManager.request(
                    apiBaseUrl + requestUrl,
                    method: .get
                ).responseDecodable(of: responseType.self) { response in
                    DispatchQueue.main.async {
                        switch response.result {
                        case .success(let response):
                            onSuccessResponse(response)
                        case .failure(let error):
                            onErrorResponse(error)
                        }
                    }
                }
            }
    }
    
    
    static let apiManager: Session = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30000

            var headers = HTTPHeaders()
            headers.add(.accept("application/json"))
            headers.add(.authorization("Bearer \(GitlyStorageKeysManager.shared.getUserTokenValue())"))

            return Session(configuration: configuration, interceptor: ApiRequestInterceptor(headers: headers))
        }()

}

struct ApiRequestInterceptor: RequestInterceptor {
    let headers: HTTPHeaders

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var modifiedURLRequest = urlRequest
        headers.forEach { header in
            modifiedURLRequest.headers.add(header)
        }
        completion(.success(modifiedURLRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // Handle retries if needed
        completion(.doNotRetry)
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
