import Foundation

// DONE: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct SingleTopicResponse: Codable {
    let details: Detail
}

struct Detail: Codable {
    let canDelete: Bool?
    enum CodingKeys: String, CodingKey {
        case canDelete = "can_delete"
    }
}
