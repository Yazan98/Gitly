// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetOrganizationsByCurrentLoggedInUserQuery: GraphQLQuery {
  public static let operationName: String = "GetOrganizationsByCurrentLoggedInUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetOrganizationsByCurrentLoggedInUser($id: String!) { user(login: $id) { __typename organizations(first: 40) { __typename nodes { __typename id name description login avatarUrl } } } }"#
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
        .field("organizations", Organizations.self, arguments: ["first": 40]),
      ] }

      /// A list of organizations the user belongs to.
      public var organizations: Organizations { __data["organizations"] }

      /// User.Organizations
      ///
      /// Parent Type: `OrganizationConnection`
      public struct Organizations: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.OrganizationConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// A list of nodes.
        public var nodes: [Node?]? { __data["nodes"] }

        /// User.Organizations.Node
        ///
        /// Parent Type: `Organization`
        public struct Node: GithubGraphQlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Organization }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GithubGraphQlApi.ID.self),
            .field("name", String?.self),
            .field("description", String?.self),
            .field("login", String.self),
            .field("avatarUrl", GithubGraphQlApi.URI.self),
          ] }

          /// The Node ID of this object
          public var id: GithubGraphQlApi.ID { __data["id"] }
          /// The organization's public profile name.
          public var name: String? { __data["name"] }
          /// The organization's public profile description.
          public var description: String? { __data["description"] }
          /// The organization's login name.
          public var login: String { __data["login"] }
          /// A URL pointing to the organization's public avatar.
          public var avatarUrl: GithubGraphQlApi.URI { __data["avatarUrl"] }
        }
      }
    }
  }
}
