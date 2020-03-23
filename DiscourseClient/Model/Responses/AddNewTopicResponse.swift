import Foundation

// DONE: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct AddNewTopicResponse: Codable {
    let id: Int
    let name: String
    let username: String
    let avatar_template: String
    let created_at: String
    let cooked: String
    let post_number: Int
    let post_type: Int
    let updated_at: String
    let reply_count: Int
    let reply_to_post_number: String?
    let quote_count: Int
    let incoming_link_count: Int
    let reads: Int
    let score: Int
    let yours: Bool
    let topic_id: Int
    let topic_slug: String
    let display_username: String
    let primary_group_name: String?
    let primary_group_flair_url: String?
    let primary_group_flair_bg_color: String?
    let primary_group_flair_color: String?
    let version: Int
    let can_edit: Bool
    let can_delete: Bool
    let can_recover: Bool
    let can_wiki: Bool
    let user_title: String?
    let actions_summary: [actions]
    let moderator: Bool
    let admin: Bool
    let staff: Bool
    let user_id: Int
    let draft_sequence: Int
    let hidden: Bool
    let trust_level: Int
    let deleted_at: String?
    let user_deleted: Bool
    let edit_reason: String?
    let can_view_edit_history: Bool
    let wiki: Bool
}

struct actions: Codable {
    let id: Int
    let can_act: Bool
}
