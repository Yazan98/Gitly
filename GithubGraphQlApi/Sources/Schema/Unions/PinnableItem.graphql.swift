// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  /// Types that can be pinned to a profile page.
  static let PinnableItem = Union(
    name: "PinnableItem",
    possibleTypes: [
      Objects.Gist.self,
      Objects.Repository.self
    ]
  )
}