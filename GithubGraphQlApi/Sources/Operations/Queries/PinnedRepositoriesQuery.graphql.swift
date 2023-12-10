// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PinnedRepositoriesQuery: GraphQLQuery {
  public static let operationName: String = "PinnedRepositories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query PinnedRepositories($userName: String!) { user(login: $userName) { __typename pinnedItems(first: 6, types: REPOSITORY) { __typename nodes { __typename ... on Repository { name id description updatedAt stargazerCount forkCount } } } } }"#
    ))

  public var userName: String

  public init(userName: String) {
    self.userName = userName
  }

  public var __variables: Variables? { ["userName": userName] }

  public struct Data: GithubGraphQlApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("user", User?.self, arguments: ["login": .variable("userName")]),
    ] }

    /// Lookup a user by login.
    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: GithubGraphQlApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pinnedItems", PinnedItems.self, arguments: [
          "first": 6,
          "types": "REPOSITORY"
        ]),
      ] }

      /// A list of repositories and gists this profile owner has pinned to their profile
      public var pinnedItems: PinnedItems { __data["pinnedItems"] }

      /// User.PinnedItems
      ///
      /// Parent Type: `PinnableItemConnection`
      public struct PinnedItems: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.PinnableItemConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// A list of nodes.
        public var nodes: [Node?]? { __data["nodes"] }

        /// User.PinnedItems.Node
        ///
        /// Parent Type: `PinnableItem`
        public struct Node: GithubGraphQlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Unions.PinnableItem }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsRepository.self),
          ] }

          public var asRepository: AsRepository? { _asInlineFragment() }

          /// User.PinnedItems.Node.AsRepository
          ///
          /// Parent Type: `Repository`
          public struct AsRepository: GithubGraphQlApi.InlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = PinnedRepositoriesQuery.Data.User.PinnedItems.Node
            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Repository }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("id", GithubGraphQlApi.ID.self),
              .field("description", String?.self),
              .field("updatedAt", GithubGraphQlApi.DateTime.self),
              .field("stargazerCount", Int.self),
              .field("forkCount", Int.self),
            ] }

            /// The name of the repository.
            public var name: String { __data["name"] }
            /// The Node ID of this object
            public var id: GithubGraphQlApi.ID { __data["id"] }
            /// The description of the repository.
            public var description: String? { __data["description"] }
            /// Identifies the date and time when the object was last updated.
            public var updatedAt: GithubGraphQlApi.DateTime { __data["updatedAt"] }
            /// Returns a count of how many stargazers there are on this object
            ///
            public var stargazerCount: Int { __data["stargazerCount"] }
            /// Returns how many forks there are of this repository in the whole network.
            public var forkCount: Int { __data["forkCount"] }
          }
        }
      }
    }
  }
}
