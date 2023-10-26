import Foundation

struct CardInfo: Identifiable, Hashable {
    var id = UUID()

    let label: String
    let image: String
    let activityType: String
}
