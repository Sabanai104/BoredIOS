//
//  BoredService.swift
//  Bored
//
//  Created by Gabriel Sabanai on 21/04/25.
//
import Foundation

public protocol BoredServicing {
    func fetch(type: String) async throws -> [BoredAPI]
}

final class BoredService: BoredServicing {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func fetch(type: String) async throws -> [BoredAPI] {
        guard let url = URL(string: "https://bored-api.appbrewery.com/filter?type=\(type)")else { throw NoNetworkError() }

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode([BoredAPI].self, from: data)
            return response
        } catch {
            throw BoredError(error: error)
        }
    }
}

public struct BoredError: LocalizedError {
    let error: Error
    public var errorDescription: String? {
        "Erro na api: \(error.localizedDescription)"
    }
}

public struct NoNetworkError: LocalizedError {
    public var errorDescription: String? = "Api fora do ar"
}
