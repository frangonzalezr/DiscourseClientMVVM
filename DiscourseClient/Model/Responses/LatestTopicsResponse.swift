import Foundation

// DONE: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct LatestTopicsResponse: Codable {
    let users: [User]
    let topicList: List
    enum CodingKeys: String, CodingKey {
        case users
        case topicList = "topic_list"
    }
}

struct List:Codable {
    let topics: [Topic]
}

struct Topic: Codable {
    let id: Int
    let title: String
    let postsCount: Int
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case postsCount = "posts_count"
    }
}
