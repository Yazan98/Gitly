// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetStarredRepositoriesByPaginationHashQuery: GraphQLQuery {
  public static let operationName: String = "GetStarredRepositoriesByPaginationHashQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetStarredRepositoriesByPaginationHashQuery($id: String!, $pageHash: String!) { user(login: $id) { __typename starredRepositories(first: 40, after: $pageHash) { __typename pageInfo { __typename hasNextPage endCursor } nodes { __typename owner { __typename login } id name description stargazerCount forkCount issues { __typename totalCount } forkCount forks { __typename totalCount totalDiskUsage } defaultBranchRef { __typename id name } isFork primaryLanguage { __typename color id name } stargazerCount visibility latestRelease { __typename createdAt databaseId description descriptionHTML id isDraft isLatest isPrerelease name publishedAt resourcePath shortDescriptionHTML tagName updatedAt url viewerCanReact author { __typename avatarUrl bio company companyHTML createdAt email id isBountyHunter location login name url websiteUrl } } } } } }"#
    ))

  public var id: String
  public var pageHash: String

  public init(
    id: String,
    pageHash: String
  ) {
    self.id = id
    self.pageHash = pageHash
  }

  public var __variables: Variables? { [
    "id": id,
    "pageHash": pageHash
  ] }

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
        .field("starredRepositories", StarredRepositories.self, arguments: [
          "first": 40,
          "after": .variable("pageHash")
        ]),
      ] }

      /// Repositories the user has starred.
      public var starredRepositories: StarredRepositories { __data["starredRepositories"] }

      /// User.StarredRepositories
      ///
      /// Parent Type: `StarredRepositoryConnection`
      public struct StarredRepositories: GithubGraphQlApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.StarredRepositoryConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pageInfo", PageInfo.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo { __data["pageInfo"] }
        /// A list of nodes.
        public var nodes: [Node?]? { __data["nodes"] }

        /// User.StarredRepositories.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: GithubGraphQlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("hasNextPage", Bool.self),
            .field("endCursor", String?.self),
          ] }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool { __data["hasNextPage"] }
          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? { __data["endCursor"] }
        }

        /// User.StarredRepositories.Node
        ///
        /// Parent Type: `Repository`
        public struct Node: GithubGraphQlApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Repository }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("owner", Owner.self),
            .field("id", GithubGraphQlApi.ID.self),
            .field("name", String.self),
            .field("description", String?.self),
            .field("stargazerCount", Int.self),
            .field("forkCount", Int.self),
            .field("issues", Issues.self),
            .field("forks", Forks.self),
            .field("defaultBranchRef", DefaultBranchRef?.self),
            .field("isFork", Bool.self),
            .field("primaryLanguage", PrimaryLanguage?.self),
            .field("visibility", GraphQLEnum<GithubGraphQlApi.RepositoryVisibility>.self),
            .field("latestRelease", LatestRelease?.self),
          ] }

          /// The User owner of the repository.
          public var owner: Owner { __data["owner"] }
          /// The Node ID of this object
          public var id: GithubGraphQlApi.ID { __data["id"] }
          /// The name of the repository.
          public var name: String { __data["name"] }
          /// The description of the repository.
          public var description: String? { __data["description"] }
          /// Returns a count of how many stargazers there are on this object
          ///
          public var stargazerCount: Int { __data["stargazerCount"] }
          /// Returns how many forks there are of this repository in the whole network.
          public var forkCount: Int { __data["forkCount"] }
          /// A list of issues that have been opened in the repository.
          public var issues: Issues { __data["issues"] }
          /// A list of direct forked repositories.
          public var forks: Forks { __data["forks"] }
          /// The Ref associated with the repository's default branch.
          public var defaultBranchRef: DefaultBranchRef? { __data["defaultBranchRef"] }
          /// Identifies if the repository is a fork.
          public var isFork: Bool { __data["isFork"] }
          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? { __data["primaryLanguage"] }
          /// Indicates the repository's visibility level.
          public var visibility: GraphQLEnum<GithubGraphQlApi.RepositoryVisibility> { __data["visibility"] }
          /// Get the latest release for the repository if one exists.
          public var latestRelease: LatestRelease? { __data["latestRelease"] }

          /// User.StarredRepositories.Node.Owner
          ///
          /// Parent Type: `RepositoryOwner`
          public struct Owner: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Interfaces.RepositoryOwner }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("login", String.self),
            ] }

            /// The username used to login.
            public var login: String { __data["login"] }
          }

          /// User.StarredRepositories.Node.Issues
          ///
          /// Parent Type: `IssueConnection`
          public struct Issues: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.IssueConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("totalCount", Int.self),
            ] }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int { __data["totalCount"] }
          }

          /// User.StarredRepositories.Node.Forks
          ///
          /// Parent Type: `RepositoryConnection`
          public struct Forks: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.RepositoryConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("totalCount", Int.self),
              .field("totalDiskUsage", Int.self),
            ] }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int { __data["totalCount"] }
            /// The total size in kilobytes of all repositories in the connection. Value will never be larger than max 32-bit signed integer.
            public var totalDiskUsage: Int { __data["totalDiskUsage"] }
          }

          /// User.StarredRepositories.Node.DefaultBranchRef
          ///
          /// Parent Type: `Ref`
          public struct DefaultBranchRef: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Ref }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", GithubGraphQlApi.ID.self),
              .field("name", String.self),
            ] }

            /// The Node ID of this object
            public var id: GithubGraphQlApi.ID { __data["id"] }
            /// The ref name.
            public var name: String { __data["name"] }
          }

          /// User.StarredRepositories.Node.PrimaryLanguage
          ///
          /// Parent Type: `Language`
          public struct PrimaryLanguage: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Language }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("color", String?.self),
              .field("id", GithubGraphQlApi.ID.self),
              .field("name", String.self),
            ] }

            /// The color defined for the current language.
            public var color: String? { __data["color"] }
            /// The Node ID of this object
            public var id: GithubGraphQlApi.ID { __data["id"] }
            /// The name of the current language.
            public var name: String { __data["name"] }
          }

          /// User.StarredRepositories.Node.LatestRelease
          ///
          /// Parent Type: `Release`
          public struct LatestRelease: GithubGraphQlApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.Release }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("createdAt", GithubGraphQlApi.DateTime.self),
              .field("databaseId", Int?.self),
              .field("description", String?.self),
              .field("descriptionHTML", GithubGraphQlApi.HTML?.self),
              .field("id", GithubGraphQlApi.ID.self),
              .field("isDraft", Bool.self),
              .field("isLatest", Bool.self),
              .field("isPrerelease", Bool.self),
              .field("name", String?.self),
              .field("publishedAt", GithubGraphQlApi.DateTime?.self),
              .field("resourcePath", GithubGraphQlApi.URI.self),
              .field("shortDescriptionHTML", GithubGraphQlApi.HTML?.self),
              .field("tagName", String.self),
              .field("updatedAt", GithubGraphQlApi.DateTime.self),
              .field("url", GithubGraphQlApi.URI.self),
              .field("viewerCanReact", Bool.self),
              .field("author", Author?.self),
            ] }

            /// Identifies the date and time when the object was created.
            public var createdAt: GithubGraphQlApi.DateTime { __data["createdAt"] }
            /// Identifies the primary key from the database.
            public var databaseId: Int? { __data["databaseId"] }
            /// The description of the release.
            public var description: String? { __data["description"] }
            /// The description of this release rendered to HTML.
            public var descriptionHTML: GithubGraphQlApi.HTML? { __data["descriptionHTML"] }
            /// The Node ID of this object
            public var id: GithubGraphQlApi.ID { __data["id"] }
            /// Whether or not the release is a draft
            public var isDraft: Bool { __data["isDraft"] }
            /// Whether or not the release is the latest releast
            public var isLatest: Bool { __data["isLatest"] }
            /// Whether or not the release is a prerelease
            public var isPrerelease: Bool { __data["isPrerelease"] }
            /// The title of the release.
            public var name: String? { __data["name"] }
            /// Identifies the date and time when the release was created.
            public var publishedAt: GithubGraphQlApi.DateTime? { __data["publishedAt"] }
            /// The HTTP path for this issue
            public var resourcePath: GithubGraphQlApi.URI { __data["resourcePath"] }
            /// A description of the release, rendered to HTML without any links in it.
            public var shortDescriptionHTML: GithubGraphQlApi.HTML? { __data["shortDescriptionHTML"] }
            /// The name of the release's Git tag
            public var tagName: String { __data["tagName"] }
            /// Identifies the date and time when the object was last updated.
            public var updatedAt: GithubGraphQlApi.DateTime { __data["updatedAt"] }
            /// The HTTP URL for this issue
            public var url: GithubGraphQlApi.URI { __data["url"] }
            /// Can user react to this subject
            public var viewerCanReact: Bool { __data["viewerCanReact"] }
            /// The author of the release
            public var author: Author? { __data["author"] }

            /// User.StarredRepositories.Node.LatestRelease.Author
            ///
            /// Parent Type: `User`
            public struct Author: GithubGraphQlApi.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { GithubGraphQlApi.Objects.User }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("avatarUrl", GithubGraphQlApi.URI.self),
                .field("bio", String?.self),
                .field("company", String?.self),
                .field("companyHTML", GithubGraphQlApi.HTML.self),
                .field("createdAt", GithubGraphQlApi.DateTime.self),
                .field("email", String.self),
                .field("id", GithubGraphQlApi.ID.self),
                .field("isBountyHunter", Bool.self),
                .field("location", String?.self),
                .field("login", String.self),
                .field("name", String?.self),
                .field("url", GithubGraphQlApi.URI.self),
                .field("websiteUrl", GithubGraphQlApi.URI?.self),
              ] }

              /// A URL pointing to the user's public avatar.
              public var avatarUrl: GithubGraphQlApi.URI { __data["avatarUrl"] }
              /// The user's public profile bio.
              public var bio: String? { __data["bio"] }
              /// The user's public profile company.
              public var company: String? { __data["company"] }
              /// The user's public profile company as HTML.
              public var companyHTML: GithubGraphQlApi.HTML { __data["companyHTML"] }
              /// Identifies the date and time when the object was created.
              public var createdAt: GithubGraphQlApi.DateTime { __data["createdAt"] }
              /// The user's publicly visible profile email.
              public var email: String { __data["email"] }
              /// The Node ID of this object
              public var id: GithubGraphQlApi.ID { __data["id"] }
              /// Whether or not this user is a participant in the GitHub Security Bug Bounty.
              public var isBountyHunter: Bool { __data["isBountyHunter"] }
              /// The user's public profile location.
              public var location: String? { __data["location"] }
              /// The username used to login.
              public var login: String { __data["login"] }
              /// The user's public profile name.
              public var name: String? { __data["name"] }
              /// The HTTP URL for this user
              public var url: GithubGraphQlApi.URI { __data["url"] }
              /// A URL pointing to the user's public website/blog.
              public var websiteUrl: GithubGraphQlApi.URI? { __data["websiteUrl"] }
            }
          }
        }
      }
    }
  }
}
