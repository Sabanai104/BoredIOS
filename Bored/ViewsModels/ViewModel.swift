import Foundation

class ViewModel: ObservableObject {
    @Published var boredAPI: BoredAPI?

    func fetch(type: String){
        boredAPI = nil
        guard let url = URL(string:"https://www.boredapi.com/api/activity?type=\(type)") else {return}

        let task = URLSession.shared.dataTask(with: url) {
            [weak self] data, _,error in
            guard let data = data, error == nil else {
                print(error)
                return
            }

            do {
                let boredAPI = try JSONDecoder().decode(BoredAPI.self, from: data)
                DispatchQueue.main.async {
                    self?.boredAPI = boredAPI
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
