import Foundation

// Este struct seria os dados de retorno da API? Acho que poderiamos dar um nome melhor para ele
// Sugestões: ActivityItem, ActivityDetails, ActivityResponse

struct BoredAPI: Hashable, Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let accessibility: Double
    let link: String
    let key: String
}
