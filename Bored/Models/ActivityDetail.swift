import Foundation

// Me parece que esse struct não precisa existir. Podemos deletar ele.
// Essa função (returnImage) poderia ser colocada no seu ActivityDetailsViewModel e ser chamada pela sua AcitivyDetailsView

struct ActivityDetail: Codable {
    func returnImage(activityTipe: String) -> String {
        let randomNumber = Int.random(in: 1...2)

        return "\(activityTipe+String(randomNumber))"
    }
}
