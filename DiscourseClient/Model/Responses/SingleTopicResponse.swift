import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct SingleTopicResponse: Codable {
    let post_stream: PostStream
    let timeline_lookup: [ Timeline]
    let id: Int
    let title: String
    let fancy_title: String
    let posts_count: Int
    let created_at: String
    let views: Int
    let reply_count: Int
    let participant_count: Int
    let like_count: Int
    let last_posted_at: String
    let visible: Bool
    let closed: Bool
    let archived: Bool
    let has_summary: Bool
    let archetype: String
    let slug: String
    let category_id: Int
    let word_count: Int
    let deleted_at: String
    let user_id: Int
    let draft: String
    let draft_key: String
    let draft_sequence: String
    let unpinned: Bool
    let pinned_globally: Bool
    let pinned: Bool
    let pinned_at: String
    let pinned_until: String
    
    
    
    
    let details: Detail
    let highest_post_number: Int
    let deleted_by: String
    let actions_summary: [Action]
    let chunk_size: Int
    let bookmarked: Bool
}

struct PostStream: Codable {
    let posts: [Post]
    let stream: [Stream]
}

struct Stream: Codable {
}

struct Participant: Codable {
    let id: Int
    let username: String
    let avatar_template: String
    let post_count: Int
}

struct Detail: Codable {
    let auto_close_at: String
    let auto_close_hours: String
    let auto_close_based_on_last_post: Bool
    let created_by: User
    let last_poster: User
    let participants: [Participant]
    let suggested_topics: [Topic]
    let notification_level: String
    let can_flag_topic: String
}

struct Timeline: Codable {
    let tipo: [Post]
}


struct Action: Codable {
    let id: Int
    let count: Int
    let hidden: Bool
    let can_act: Bool
}

struct Post: Codable {
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
    let reply_to_post_number: String
    let quote_count: Int
    let avg_time: String
    let incoming_link_count: Int
    let reads: Int
    let score: Int
    let yours: Bool
    let topic_id: Int
    let topic_slug: String
    let display_username: String
    let primary_group_name: String
    let primary_group_flair_url: String
    let primary_group_flair_bg_color: String
    let primary_group_flair_color: String
    let version: Int
    let can_edit: Bool
    let can_delete: Bool
    let can_recover: Bool
    let can_wiki: Bool
    let read: Bool
    let user_title: String
    let actions_summary: [Action]
    let moderator: Bool
    let admin: Bool
    let staff: Bool
    let user_id: Int
    let hidden: Bool
    let hidden_reason_id: String
    let trust_level: Int
    let deleted_at: String
    let user_deleted: Bool
    let edit_reason: String
    let can_view_edit_history: Bool
    let wiki: Bool
    let polls: Poll
    let polls_votes: Vote
}

struct Vote: Codable {
    let poll: [Poll]
}
struct Poll: Codable {
    let options: [Option]
    let voters: Int
    let status: String
    let name: String
    let type: String
}

struct Option: Codable {
    let id: String
    let html: String
    let votes: Int
}
