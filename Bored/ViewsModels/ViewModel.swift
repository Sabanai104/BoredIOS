import Foundation

final class ViewModel {
    private let service: BoredServicing
    private let viewState: any ViewStateProtocol

    let defaultBoredApi = BoredAPI(
        activity: "Take your dog on a walk",
        type: "relaxation",
        participants: 0,
        price: 0.0,
        accessibility: "Few to no challenges",
        link: "",
        key: ""
    )

    init(service: BoredServicing, viewState: any ViewStateProtocol) {
        self.service = service
        self.viewState = viewState
    }

    func fetch(type: String) {
        Task {
            do {
                let result = try await service.fetch(type: type)
                let boredInfo = handleBoredInfos(boredInfos: result)
                await presentBoredInfo(boredInfo: boredInfo)
            } catch {
                await presentError(error)
            }
        }
    }

    private func handleBoredInfos(boredInfos: [BoredAPI]) -> BoredAPI {
        if !boredInfos.isEmpty {
            return boredInfos.randomElement() ?? defaultBoredApi
        } else {
            return defaultBoredApi
        }
    }
}

@MainActor
extension ViewModel {
    private func presentBoredInfo(boredInfo: BoredAPI) {
        viewState.boredInfo = boredInfo
        print(viewState.boredInfo ?? "")
    }

    private func presentError(_ error: Error) {
        print(error.localizedDescription)
        viewState.boredInfo = defaultBoredApi
    }
}
