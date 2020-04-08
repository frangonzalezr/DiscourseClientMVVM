import Foundation

// DONE: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestTopicsResponse: Codable {
    let users: [User]
    let topic_list: List
}

struct List:Codable {
    let can_create_topic: Bool
    let more_topics_url: String
    let draft: Int?
    let draft_key: String
    let draft_sequence: Int?
    let per_page: Int
    let topics: [Topic]
}

struct Topic: Codable {
    let id: Int
    let title: String
//    let fancy_title: String
//    let slug: String
    let postsCount: Int
//    let reply_count: Int
//    let highest_post_number: Int
//    let image_url: String?
//    let created_at: String
//    let last_posted_at: String
//    let bumped: Bool
//    let bumped_at: String
//    let unseen: Bool
//    let pinned: Bool
//    let unpinned: Int?
//    let excerpt: String?
//    let visible: Bool
//    let closed: Bool
//    let archived: Bool
//    let bookmarked: Bool?
//    let liked: Bool?
//    let views: Int
//    let like_count: Int
//    let has_summary: Bool
//    let archetype: String
//    let last_poster_username: String
//    let category_id: Int
//    let pinned_globally: Bool
//    let posters: [Poster]
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case postsCount = "posts_count"
    }
}

//struct Poster: Codable {
//    let extras: String?
//    let description: String
//    let user_id: Int
//    let primary_group_id: Int?
//}
