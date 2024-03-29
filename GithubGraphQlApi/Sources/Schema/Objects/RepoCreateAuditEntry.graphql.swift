// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Audit log entry for a repo.create event.
  static let RepoCreateAuditEntry = ApolloAPI.Object(
    typename: "RepoCreateAuditEntry",
    implementedInterfaces: [
      Interfaces.Node.self,
      Interfaces.AuditEntry.self,
      Interfaces.RepositoryAuditEntryData.self,
      Interfaces.OrganizationAuditEntryData.self
    ]
  )
}