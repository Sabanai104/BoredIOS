import Foundation

public struct BoredAPI: Hashable, Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let accessibility: String
    let link: String
    let key: String
}
