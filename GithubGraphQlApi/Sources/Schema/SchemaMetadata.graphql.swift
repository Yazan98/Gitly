// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GithubGraphQlApi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GithubGraphQlApi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GithubGraphQlApi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GithubGraphQlApi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return GithubGraphQlApi.Objects.Query
    case "User": return GithubGraphQlApi.Objects.User
    case "CodeOfConduct": return GithubGraphQlApi.Objects.CodeOfConduct
    case "Enterprise": return GithubGraphQlApi.Objects.Enterprise
    case "Organization": return GithubGraphQlApi.Objects.Organization
    case "EnterpriseUserAccount": return GithubGraphQlApi.Objects.EnterpriseUserAccount
    case "Bot": return GithubGraphQlApi.Objects.Bot
    case "Release": return GithubGraphQlApi.Objects.Release
    case "Issue": return GithubGraphQlApi.Objects.Issue
    case "PullRequest": return GithubGraphQlApi.Objects.PullRequest
    case "Project": return GithubGraphQlApi.Objects.Project
    case "ProjectV2": return GithubGraphQlApi.Objects.ProjectV2
    case "TeamDiscussion": return GithubGraphQlApi.Objects.TeamDiscussion
    case "TeamDiscussionComment": return GithubGraphQlApi.Objects.TeamDiscussionComment
    case "CommitComment": return GithubGraphQlApi.Objects.CommitComment
    case "DiscussionComment": return GithubGraphQlApi.Objects.DiscussionComment
    case "IssueComment": return GithubGraphQlApi.Objects.IssueComment
    case "Discussion": return GithubGraphQlApi.Objects.Discussion
    case "Repository": return GithubGraphQlApi.Objects.Repository
    case "Topic": return GithubGraphQlApi.Objects.Topic
    case "Gist": return GithubGraphQlApi.Objects.Gist
    case "Team": return GithubGraphQlApi.Objects.Team
    case "Commit": return GithubGraphQlApi.Objects.Commit
    case "Tree": return GithubGraphQlApi.Objects.Tree
    case "Blob": return GithubGraphQlApi.Objects.Blob
    case "Tag": return GithubGraphQlApi.Objects.Tag
    case "DiscussionCategory": return GithubGraphQlApi.Objects.DiscussionCategory
    case "PinnedDiscussion": return GithubGraphQlApi.Objects.PinnedDiscussion
    case "RepositoryVulnerabilityAlert": return GithubGraphQlApi.Objects.RepositoryVulnerabilityAlert
    case "DependabotUpdate": return GithubGraphQlApi.Objects.DependabotUpdate
    case "PullRequestReview": return GithubGraphQlApi.Objects.PullRequestReview
    case "PullRequestReviewComment": return GithubGraphQlApi.Objects.PullRequestReviewComment
    case "CommitCommentThread": return GithubGraphQlApi.Objects.CommitCommentThread
    case "PullRequestCommitCommentThread": return GithubGraphQlApi.Objects.PullRequestCommitCommentThread
    case "GistComment": return GithubGraphQlApi.Objects.GistComment
    case "Milestone": return GithubGraphQlApi.Objects.Milestone
    case "Mannequin": return GithubGraphQlApi.Objects.Mannequin
    case "CheckRun": return GithubGraphQlApi.Objects.CheckRun
    case "StatusContext": return GithubGraphQlApi.Objects.StatusContext
    case "WorkflowRun": return GithubGraphQlApi.Objects.WorkflowRun
    case "WorkflowRunFile": return GithubGraphQlApi.Objects.WorkflowRunFile
    case "Workflow": return GithubGraphQlApi.Objects.Workflow
    case "RepositoryTopic": return GithubGraphQlApi.Objects.RepositoryTopic
    case "PullRequestCommit": return GithubGraphQlApi.Objects.PullRequestCommit
    case "ClosedEvent": return GithubGraphQlApi.Objects.ClosedEvent
    case "CrossReferencedEvent": return GithubGraphQlApi.Objects.CrossReferencedEvent
    case "MergedEvent": return GithubGraphQlApi.Objects.MergedEvent
    case "ReviewDismissedEvent": return GithubGraphQlApi.Objects.ReviewDismissedEvent
    case "ConvertToDraftEvent": return GithubGraphQlApi.Objects.ConvertToDraftEvent
    case "ReadyForReviewEvent": return GithubGraphQlApi.Objects.ReadyForReviewEvent
    case "EnterpriseServerInstallation": return GithubGraphQlApi.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GithubGraphQlApi.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GithubGraphQlApi.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GithubGraphQlApi.Objects.EnterpriseServerUserAccountsUpload
    case "Package": return GithubGraphQlApi.Objects.Package
    case "PackageVersion": return GithubGraphQlApi.Objects.PackageVersion
    case "PackageFile": return GithubGraphQlApi.Objects.PackageFile
    case "ProjectColumn": return GithubGraphQlApi.Objects.ProjectColumn
    case "ProjectCard": return GithubGraphQlApi.Objects.ProjectCard
    case "UserContentEdit": return GithubGraphQlApi.Objects.UserContentEdit
    case "Label": return GithubGraphQlApi.Objects.Label
    case "ProjectV2Field": return GithubGraphQlApi.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GithubGraphQlApi.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GithubGraphQlApi.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GithubGraphQlApi.Objects.ProjectV2Item
    case "DraftIssue": return GithubGraphQlApi.Objects.DraftIssue
    case "ProjectV2ItemFieldDateValue": return GithubGraphQlApi.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GithubGraphQlApi.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GithubGraphQlApi.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GithubGraphQlApi.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GithubGraphQlApi.Objects.ProjectV2ItemFieldTextValue
    case "UserStatus": return GithubGraphQlApi.Objects.UserStatus
    case "Reaction": return GithubGraphQlApi.Objects.Reaction
    case "OrganizationInvitation": return GithubGraphQlApi.Objects.OrganizationInvitation
    case "ProjectV2View": return GithubGraphQlApi.Objects.ProjectV2View
    case "ProjectV2Workflow": return GithubGraphQlApi.Objects.ProjectV2Workflow
    case "License": return GithubGraphQlApi.Objects.License
    case "BranchProtectionRule": return GithubGraphQlApi.Objects.BranchProtectionRule
    case "Ref": return GithubGraphQlApi.Objects.Ref
    case "Comparison": return GithubGraphQlApi.Objects.Comparison
    case "CheckSuite": return GithubGraphQlApi.Objects.CheckSuite
    case "App": return GithubGraphQlApi.Objects.App
    case "IpAllowListEntry": return GithubGraphQlApi.Objects.IpAllowListEntry
    case "Deployment": return GithubGraphQlApi.Objects.Deployment
    case "DeploymentStatus": return GithubGraphQlApi.Objects.DeploymentStatus
    case "Environment": return GithubGraphQlApi.Objects.Environment
    case "Push": return GithubGraphQlApi.Objects.Push
    case "DeploymentReview": return GithubGraphQlApi.Objects.DeploymentReview
    case "Language": return GithubGraphQlApi.Objects.Language
    case "Status": return GithubGraphQlApi.Objects.Status
    case "StatusCheckRollup": return GithubGraphQlApi.Objects.StatusCheckRollup
    case "BypassForcePushAllowance": return GithubGraphQlApi.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GithubGraphQlApi.Objects.BypassPullRequestAllowance
    case "PushAllowance": return GithubGraphQlApi.Objects.PushAllowance
    case "ReviewDismissalAllowance": return GithubGraphQlApi.Objects.ReviewDismissalAllowance
    case "DeployKey": return GithubGraphQlApi.Objects.DeployKey
    case "DiscussionPoll": return GithubGraphQlApi.Objects.DiscussionPoll
    case "DiscussionPollOption": return GithubGraphQlApi.Objects.DiscussionPollOption
    case "MergeQueue": return GithubGraphQlApi.Objects.MergeQueue
    case "MergeQueueEntry": return GithubGraphQlApi.Objects.MergeQueueEntry
    case "PinnedIssue": return GithubGraphQlApi.Objects.PinnedIssue
    case "RepositoryRuleset": return GithubGraphQlApi.Objects.RepositoryRuleset
    case "RepositoryRulesetBypassActor": return GithubGraphQlApi.Objects.RepositoryRulesetBypassActor
    case "RepositoryRule": return GithubGraphQlApi.Objects.RepositoryRule
    case "SecurityAdvisory": return GithubGraphQlApi.Objects.SecurityAdvisory
    case "CWE": return GithubGraphQlApi.Objects.CWE
    case "ReviewRequest": return GithubGraphQlApi.Objects.ReviewRequest
    case "PullRequestReviewThread": return GithubGraphQlApi.Objects.PullRequestReviewThread
    case "AssignedEvent": return GithubGraphQlApi.Objects.AssignedEvent
    case "BaseRefDeletedEvent": return GithubGraphQlApi.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GithubGraphQlApi.Objects.BaseRefForcePushedEvent
    case "DemilestonedEvent": return GithubGraphQlApi.Objects.DemilestonedEvent
    case "DeployedEvent": return GithubGraphQlApi.Objects.DeployedEvent
    case "DeploymentEnvironmentChangedEvent": return GithubGraphQlApi.Objects.DeploymentEnvironmentChangedEvent
    case "HeadRefDeletedEvent": return GithubGraphQlApi.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GithubGraphQlApi.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GithubGraphQlApi.Objects.HeadRefRestoredEvent
    case "LabeledEvent": return GithubGraphQlApi.Objects.LabeledEvent
    case "LockedEvent": return GithubGraphQlApi.Objects.LockedEvent
    case "MilestonedEvent": return GithubGraphQlApi.Objects.MilestonedEvent
    case "ReferencedEvent": return GithubGraphQlApi.Objects.ReferencedEvent
    case "RenamedTitleEvent": return GithubGraphQlApi.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GithubGraphQlApi.Objects.ReopenedEvent
    case "ReviewRequestRemovedEvent": return GithubGraphQlApi.Objects.ReviewRequestRemovedEvent
    case "ReviewRequestedEvent": return GithubGraphQlApi.Objects.ReviewRequestedEvent
    case "SubscribedEvent": return GithubGraphQlApi.Objects.SubscribedEvent
    case "UnassignedEvent": return GithubGraphQlApi.Objects.UnassignedEvent
    case "UnlabeledEvent": return GithubGraphQlApi.Objects.UnlabeledEvent
    case "UnlockedEvent": return GithubGraphQlApi.Objects.UnlockedEvent
    case "UnsubscribedEvent": return GithubGraphQlApi.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GithubGraphQlApi.Objects.UserBlockedEvent
    case "AddedToMergeQueueEvent": return GithubGraphQlApi.Objects.AddedToMergeQueueEvent
    case "AddedToProjectEvent": return GithubGraphQlApi.Objects.AddedToProjectEvent
    case "AutoMergeDisabledEvent": return GithubGraphQlApi.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GithubGraphQlApi.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GithubGraphQlApi.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GithubGraphQlApi.Objects.AutoSquashEnabledEvent
    case "AutomaticBaseChangeFailedEvent": return GithubGraphQlApi.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GithubGraphQlApi.Objects.AutomaticBaseChangeSucceededEvent
    case "BaseRefChangedEvent": return GithubGraphQlApi.Objects.BaseRefChangedEvent
    case "CommentDeletedEvent": return GithubGraphQlApi.Objects.CommentDeletedEvent
    case "ConnectedEvent": return GithubGraphQlApi.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GithubGraphQlApi.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GithubGraphQlApi.Objects.ConvertedToDiscussionEvent
    case "DisconnectedEvent": return GithubGraphQlApi.Objects.DisconnectedEvent
    case "MarkedAsDuplicateEvent": return GithubGraphQlApi.Objects.MarkedAsDuplicateEvent
    case "MentionedEvent": return GithubGraphQlApi.Objects.MentionedEvent
    case "MovedColumnsInProjectEvent": return GithubGraphQlApi.Objects.MovedColumnsInProjectEvent
    case "PinnedEvent": return GithubGraphQlApi.Objects.PinnedEvent
    case "RemovedFromMergeQueueEvent": return GithubGraphQlApi.Objects.RemovedFromMergeQueueEvent
    case "RemovedFromProjectEvent": return GithubGraphQlApi.Objects.RemovedFromProjectEvent
    case "TransferredEvent": return GithubGraphQlApi.Objects.TransferredEvent
    case "UnmarkedAsDuplicateEvent": return GithubGraphQlApi.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GithubGraphQlApi.Objects.UnpinnedEvent
    case "LinkedBranch": return GithubGraphQlApi.Objects.LinkedBranch
    case "SponsorsActivity": return GithubGraphQlApi.Objects.SponsorsActivity
    case "SponsorsTier": return GithubGraphQlApi.Objects.SponsorsTier
    case "Sponsorship": return GithubGraphQlApi.Objects.Sponsorship
    case "SponsorsListing": return GithubGraphQlApi.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GithubGraphQlApi.Objects.SponsorsListingFeaturedItem
    case "SponsorshipNewsletter": return GithubGraphQlApi.Objects.SponsorshipNewsletter
    case "UserList": return GithubGraphQlApi.Objects.UserList
    case "PublicKey": return GithubGraphQlApi.Objects.PublicKey
    case "SavedReply": return GithubGraphQlApi.Objects.SavedReply
    case "ReleaseAsset": return GithubGraphQlApi.Objects.ReleaseAsset
    case "MembersCanDeleteReposClearAuditEntry": return GithubGraphQlApi.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GithubGraphQlApi.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GithubGraphQlApi.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GithubGraphQlApi.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GithubGraphQlApi.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessBlockedAuditEntry": return GithubGraphQlApi.Objects.OrgOauthAppAccessBlockedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GithubGraphQlApi.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GithubGraphQlApi.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgOauthAppAccessUnblockedAuditEntry": return GithubGraphQlApi.Objects.OrgOauthAppAccessUnblockedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GithubGraphQlApi.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GithubGraphQlApi.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GithubGraphQlApi.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GithubGraphQlApi.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GithubGraphQlApi.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GithubGraphQlApi.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GithubGraphQlApi.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GithubGraphQlApi.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GithubGraphQlApi.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GithubGraphQlApi.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GithubGraphQlApi.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GithubGraphQlApi.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GithubGraphQlApi.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GithubGraphQlApi.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GithubGraphQlApi.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GithubGraphQlApi.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GithubGraphQlApi.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GithubGraphQlApi.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GithubGraphQlApi.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GithubGraphQlApi.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GithubGraphQlApi.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GithubGraphQlApi.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GithubGraphQlApi.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GithubGraphQlApi.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GithubGraphQlApi.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GithubGraphQlApi.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GithubGraphQlApi.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GithubGraphQlApi.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GithubGraphQlApi.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GithubGraphQlApi.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GithubGraphQlApi.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GithubGraphQlApi.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GithubGraphQlApi.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GithubGraphQlApi.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GithubGraphQlApi.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GithubGraphQlApi.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GithubGraphQlApi.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GithubGraphQlApi.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GithubGraphQlApi.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GithubGraphQlApi.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GithubGraphQlApi.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GithubGraphQlApi.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GithubGraphQlApi.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GithubGraphQlApi.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GithubGraphQlApi.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GithubGraphQlApi.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GithubGraphQlApi.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GithubGraphQlApi.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GithubGraphQlApi.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GithubGraphQlApi.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GithubGraphQlApi.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GithubGraphQlApi.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GithubGraphQlApi.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GithubGraphQlApi.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "VerifiableDomain": return GithubGraphQlApi.Objects.VerifiableDomain
    case "RepositoryMigration": return GithubGraphQlApi.Objects.RepositoryMigration
    case "MigrationSource": return GithubGraphQlApi.Objects.MigrationSource
    case "OrganizationIdentityProvider": return GithubGraphQlApi.Objects.OrganizationIdentityProvider
    case "ExternalIdentity": return GithubGraphQlApi.Objects.ExternalIdentity
    case "OIDCProvider": return GithubGraphQlApi.Objects.OIDCProvider
    case "EnterpriseRepositoryInfo": return GithubGraphQlApi.Objects.EnterpriseRepositoryInfo
    case "EnterpriseAdministratorInvitation": return GithubGraphQlApi.Objects.EnterpriseAdministratorInvitation
    case "RepositoryInvitation": return GithubGraphQlApi.Objects.RepositoryInvitation
    case "EnterpriseIdentityProvider": return GithubGraphQlApi.Objects.EnterpriseIdentityProvider
    case "MarketplaceCategory": return GithubGraphQlApi.Objects.MarketplaceCategory
    case "MarketplaceListing": return GithubGraphQlApi.Objects.MarketplaceListing
    case "OrganizationMigration": return GithubGraphQlApi.Objects.OrganizationMigration
    case "MemberFeatureRequestNotification": return GithubGraphQlApi.Objects.MemberFeatureRequestNotification
    case "PackageTag": return GithubGraphQlApi.Objects.PackageTag
    case "PullRequestThread": return GithubGraphQlApi.Objects.PullRequestThread
    case "PinnableItemConnection": return GithubGraphQlApi.Objects.PinnableItemConnection
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
