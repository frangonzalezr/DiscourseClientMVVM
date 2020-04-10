import Foundation

// DONE: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct AddNewTopicResponse: Codable {
    let id: Int
    let name: String
    let username: String
    let avatarTemplate: String
    let createdAt: String
    let cooked: String
    let postNumber: Int
    let postType: Int
    let updatedAt: String
    let replyCount: Int
    let replyToPostNumber: String?
    let quoteCount: Int
    let incomingLinkCount: Int
    let reads: Int
    let score: Int
    let yours: Bool
    let topicId: Int
    let topicSlug: String
    let displayUsername: String
    let primaryGroupName: String?
    let primaryGroupFlairUrl: String?
    let primaryGroupFlairBgColor: String?
    let primaryGroupFlairColor: String?
    let version: Int
    let canEdit: Bool
    let canDelete: Bool
    let canRecover: Bool
    let canWiki: Bool
    let userTitle: String?
    let actionsSummary: [actions]
    let moderator: Bool
    let admin: Bool
    let staff: Bool
    let userId: Int
    let draftSequence: Int
    let hidden: Bool
    let trustLevel: Int
    let deletedAt: String?
    let userDeleted: Bool
    let editReason: String?
    let canViewEditHistory: Bool
    let wiki: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case avatarTemplate = "avatar_template"
        case createdAt = "created_at"
        case cooked
        case postNumber = "post_number"
        case postType = "post_type"
        case updatedAt = "updated_at"
        case replyCount = "reply_count"
        case replyToPostNumber = "reply_to_post_number"
        case quoteCount = "quote_count"
        case incomingLinkCount = "incoming_link_count"
        case reads
        case score
        case yours
        case topicId = "topic_id"
        case topicSlug = "topic_slug"
        case displayUsername = "display_username"
        case primaryGroupName = "primary_group_name"
        case primaryGroupFlairUrl = "primary_group_flair_url"
        case primaryGroupFlairBgColor = "primary_group_flair_bg_color"
        case primaryGroupFlairColor = "primary_group_flair_color"
        case version
        case canEdit = "can_edit"
        case canDelete = "can_delete"
        case canRecover = "can_recover"
        case canWiki = "can_wiki"
        case userTitle = "user_title"
        case actionsSummary = "actions_summary"
        case moderator
        case admin
        case staff
        case userId = "user_id"
        case draftSequence = "draft_sequence"
        case hidden
        case trustLevel = "trust_level"
        case deletedAt = "deleted_at"
        case userDeleted = "user_deleted"
        case editReason = "edit_reason"
        case canViewEditHistory = "can_view_edit_history"
        case wiki
    }
}

struct actions: Codable {
    let id: Int
    let canAct: Bool
    enum CodingKeys: String, CodingKey {
        case id
        case canAct = "can_act"
    }
}
