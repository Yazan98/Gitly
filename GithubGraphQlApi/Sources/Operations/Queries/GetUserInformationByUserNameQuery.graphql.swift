// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetUserInformationByUserNameQuery: GraphQLQuery {
  public static let operationName: String = "GetUserInformationByUserName"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetUserInformationByUserName($userName: String!) { user(login: $userName) { __typename login name bio organizations(first: 100) { __typename totalCount } avatarUrl(size: 50) company createdAt followers { __typename totalCount } following { __typename totalCount } hasSponsorsListing isGitHubStar location starredRepositories { __typename isOverLimit totalCount } status { __typename createdAt emoji emojiHTML expiresAt id indicatesLimitedAvailability message updatedAt } twitterUsername websiteUrl email isCampusExpert isDeveloperProgramMember updatedAt url viewerIsFollowing viewerCanFollow } }"#
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
        .field("login", String.self),
        .field("name", String?.self),
        .field("bio", String?.self),
        .field("organizations", Organizations.self, arguments: ["first": 100]),
        .field("avatarUrl", GithubGraphQlApi.URI.self, arguments: ["size": 50]),
        .field("company", String?.self),
        .field("createdAt", GithubGraphQlApi.DateTime.self),
        .field("followers", Followers.self),
        .field("following", Following.self),
        .field("hasSponsorsListing", Bool.self),
        .field("isGitHubStar", Bool.self),
        .field("location", String?.self),
        .field("starredRepositories", StarredRepositories.self),
        .field("status", Status?.self),
        .field("twitterUsername", String?.self),
        .field("websiteUrl", GithubGraphQlApi.URI?.self),
        .field("email", String.self),
        .field("isCampusExpert", Bool.self),
        .field("isDeveloperProgramMember", Bool.self),
        .field("updatedAt", GithubGraphQlApi.DateTime.self),
        .field("url", GithubGraphQlApi.URI.self),
        .field("viewerIsFollowing", Bool.self),
        .field("viewerCanFollow", Bool.self),
      ] }

      /// The username used to login.
      public var login: String { __data["login"] }
      /// The user's public profile name.
      public var name: String? { __data["name"] }
      /// The user's public profile bio.
      public var bio: String? { __data["bio"] }
      /// A list of organizations the user belongs to.
      public var organizations: Organizations { __data["organizations"] }
      /// A URL pointing to the user's public avatar.
      public var avatarUrl: GithubGraphQlApi.URI { __data["avatarUrl"] }
      /// The user's public profile company.
      public var company: String? { __data["company"] }
      /// Identifies the date and time when the object was created.
      public var createdAt: GithubGraphQlApi.DateTime { __data["createdAt"] }
      /// A list of users the given user is followed by.
      public var followers: Followers { __data["followers"] }
      /// A list of users the given user is following.
      public var following: Following { __data["following"] }
      /// True if this user/organization has a GitHub Sponsors listing.
      public var hasSponsorsListing: Bool { __data["hasSponsorsListing"] }
      /// Whether or not this user is a member of the GitHub Stars Program.
      public var isGitHubStar: Bool { __data["isGitHubStar"] }
      /// The user's public profile location.
      public var location: String? { __data["location"] }
      /// Repositories the user has starred.
      public var starredRepositories: StarredRepositories { __data["starredRepositories"] }
      /// The user's description of what they're currently doing.
      public var status: Status? { __data["status"] }
      /// The user's Twitter username.
      public var twitterUsername: String? { __data["twitterUsername"] }
      /// A URL pointing to the user's public website/blog.
      public var websiteUrl: GithubGraphQlApi.URI? { __data["websiteUrl"] }
      /// The user's publicly visible profile email.
      public var email: String { __data["email"] }
      /// Whether or not this user is a participant in the GitHub Campus Experts Program.
      public var isCampusExpert: Bool { __data["isCampusExpert"] }
      /// Whether or not this user is a GitHub Developer Program member.
      public var isDeveloperProgramMember: Bool { __data["isDeveloperProgramMember"] }
      /// Identifies the date and time when the object was last updated.
      public var updatedAt: GithubGraphQlApi.DateTime { __data["updatedAt"] }
      /// The HTTP URL for this user
      public var url: GithubGraphQlApi.URI { __data["url"] }
      /// Whether or not this user is followed by the viewer. Inverse of isFollowingViewer.
      public var viewerIsFollowing: Bool { __data["viewerIsFollowing"] }
      /// Whether or not the viewer is able to follow the user.
      public var viewerCanFollow: Bool { __data["viewerCanFollow"] }

      /// User.Organizations
      ///
      /// Parent Type: `OrganizationConnection`
      public struct Organizations: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.OrganizationConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

      /// User.Followers
      ///
      /// Parent Type: `FollowerConnection`
      public struct Followers: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.FollowerConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

      /// User.Following
      ///
      /// Parent Type: `FollowingConnection`
      public struct Following: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.FollowingConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

      /// User.StarredRepositories
      ///
      /// Parent Type: `StarredRepositoryConnection`
      public struct StarredRepositories: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.StarredRepositoryConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("isOverLimit", Bool.self),
          .field("totalCount", Int.self),
        ] }

        /// Is the list of stars for this user truncated? This is true for users that have many stars.
        public var isOverLimit: Bool { __data["isOverLimit"] }
        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }

      /// User.Status
      ///
      /// Parent Type: `UserStatus`
      public struct Status: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.UserStatus }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("createdAt", GithubGraphQlApi.DateTime.self),
          .field("emoji", String?.self),
          .field("emojiHTML", GithubGraphQlApi.HTML?.self),
          .field("expiresAt", GithubGraphQlApi.DateTime?.self),
          .field("id", GithubGraphQlApi.ID.self),
          .field("indicatesLimitedAvailability", Bool.self),
          .field("message", String?.self),
          .field("updatedAt", GithubGraphQlApi.DateTime.self),
        ] }

        /// Identifies the date and time when the object was created.
        public var createdAt: GithubGraphQlApi.DateTime { __data["createdAt"] }
        /// An emoji summarizing the user's status.
        public var emoji: String? { __data["emoji"] }
        /// The status emoji as HTML.
        public var emojiHTML: GithubGraphQlApi.HTML? { __data["emojiHTML"] }
        /// If set, the status will not be shown after this date.
        public var expiresAt: GithubGraphQlApi.DateTime? { __data["expiresAt"] }
        /// The Node ID of this object
        public var id: GithubGraphQlApi.ID { __data["id"] }
        /// Whether this status indicates the user is not fully available on GitHub.
        public var indicatesLimitedAvailability: Bool { __data["indicatesLimitedAvailability"] }
        /// A brief message describing what the user is doing.
        public var message: String? { __data["message"] }
        /// Identifies the date and time when the object was last updated.
        public var updatedAt: GithubGraphQlApi.DateTime { __data["updatedAt"] }
      }
    }
  }
}
