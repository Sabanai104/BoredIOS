//
//  BoredServiceSpy.swift
//  Bored
//
//  Created by Gabriel Sabanai on 22/04/25.
//

@testable import Bored

final class BoredServiceSpy: BoredServicing {
    var shouldFail = false
    let mockBoredAPI = BoredAPI(
        activity: "Narute",
        type: "Narutin",
        participants: 0,
        price: 0.0,
        accessibility: "Few to no challenges",
        link: "",
        key: ""
    )

    func fetch(type: String) async throws -> [BoredAPI] {
        if shouldFail {
            throw BoredError(error: ErrorSpy())
        }
        return [mockBoredAPI]
    }
}

struct ErrorSpy: Error {}
