import Foundation

// Esse ViewModel é de qual View? É sempre bom a gente deixar isso explícito.
// Um bom nome seria ActivyDetailsViewModel
class ViewModel: ObservableObject {
    @Published var boredAPI: BoredAPI? // poderiamos renomear para activiyDetails
    let repository: ActivyRepository

    // É sempre bom ter em seus projetos uma classe que faz requests, geralmente, chamamos de Network, Networking, NetworkProvider ou NetworkManager.
    // Também é bom ter uma classe responsável ou fazer as requests das acivities em específico, chamamos de ActivityRepository ou ActivityWoker
    func fetch(type: String) {
        activityDetails = repository.fetch(type: type)
        // boredAPI = nil
        // guard let url = URL(string:"https://www.boredapi.com/api/activity?type=\(type)") else { return }

        // let task = URLSession.shared.dataTask(with: url) {
        //     [weak self] data, _,error in
        //     guard let data = data, error == nil else {
        //         print(error)
        //         return
        //     }

        //     do {
        //         let boredAPI = try JSONDecoder().decode(BoredAPI.self, from: data)
        //         DispatchQueue.main.async {
        //             self?.boredAPI = boredAPI
        //         }
        //     }
        //     catch {
        //         print(error)
        //     }
        // }
        // task.resume()
    }
}

// Em outro arquivo, exemplo de Worker e/ou Repository (Acitivity)

class ActivyRepository {

    let networkProvider: NetworkProvider

    func fetchActivities() -> [Activity] {
        [CardInfo(label: "Random", image: "random", activityType: "random"),
        CardInfo(label: "Education", image: "education", activityType: "education"),
        CardInfo(label: "Recreational", image: "recreational", activityType: "recreational"),
        CardInfo(label: "Social", image: "social", activityType: "social"),
        CardInfo(label: "Cooking", image:"cooking", activityType: "cooking"),
        CardInfo(label: "Charity", image: "charity", activityType: "charity"),
        CardInfo(label: "Do it yourself", image: "doYourself", activityType: "diy"),
        CardInfo(label: "Relaxation", image: "relaxation", activityType: "relaxation"),
        CardInfo(label: "Busy work", image: "busyWork", activityType: "busywork"),
        CardInfo(label: "Music", image: "music", activityType: "music")
        ]
    }

    func fetchAcivity(type: String) -> ActivityItem {
        networkProvider.fetch(url: "https://www.boredapi.com/api/activity?type=\(type)")
    }
}