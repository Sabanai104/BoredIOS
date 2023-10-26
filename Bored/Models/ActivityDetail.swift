import Foundation


struct ActivityDetail: Codable {
    func returnImage(activityTipe: String) -> String {
        let randomNumber = Int.random(in: 1...2)

        return "\(activityTipe+String(randomNumber))"
    }
}
