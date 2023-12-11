// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetFollowingsFirstPageQuery: GraphQLQuery {
  public static let operationName: String = "GetFollowingsFirstPageQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetFollowingsFirstPageQuery($id: String!) { user(login: $id) { __typename following(first: 40) { __typename pageInfo { __typename endCursor hasNextPage } edges { __typename node { __typename login name bio avatarUrl } } } } }"#
    ))

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: GithubGraphQlApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("user", User?.self, arguments: ["login": .variable("id")]),
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
        .field("following", Following.self, arguments: ["first": 40]),
      ] }

      /// A list of users the given user is following.
      public var following: Following { __data["following"] }

      /// User.Following
      ///
      /// Parent Type: `FollowingConnection`
      public struct Following: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.FollowingConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pageInfo", PageInfo.self),
          .field("edges", [Edge?]?.self),
        ] }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo { __data["pageInfo"] }
        /// A list of edges.
        public var edges: [Edge?]? { __data["edges"] }

        /// User.Following.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: GithubGraphQlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("endCursor", String?.self),
            .field("hasNextPage", Bool.self),
          ] }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? { __data["endCursor"] }
          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool { __data["hasNextPage"] }
        }

        /// User.Following.Edge
        ///
        /// Parent Type: `UserEdge`
        public struct Edge: GithubGraphQlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.UserEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node?.self),
          ] }

          /// The item at the end of the edge.
          public var node: Node? { __data["node"] }

          /// User.Following.Edge.Node
          ///
          /// Parent Type: `User`
          public struct Node: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("login", String.self),
              .field("name", String?.self),
              .field("bio", String?.self),
              .field("avatarUrl", GithubGraphQlApi.URI.self),
            ] }

            /// The username used to login.
            public var login: String { __data["login"] }
            /// The user's public profile name.
            public var name: String? { __data["name"] }
            /// The user's public profile bio.
            public var bio: String? { __data["bio"] }
            /// A URL pointing to the user's public avatar.
            public var avatarUrl: GithubGraphQlApi.URI { __data["avatarUrl"] }
          }
        }
      }
    }
  }
}
