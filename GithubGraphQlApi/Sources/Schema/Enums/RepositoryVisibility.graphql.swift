// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The repository's visibility level.
public enum RepositoryVisibility: String, EnumType {
  /// The repository is visible only to those with explicit access.
  case `private` = "PRIVATE"
  /// The repository is visible to everyone.
  case `public` = "PUBLIC"
  /// The repository is visible only to users in the same business.
  case `internal` = "INTERNAL"
}
