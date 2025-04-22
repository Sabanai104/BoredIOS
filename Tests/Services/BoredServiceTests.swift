//
//  BoredServiceTests.swift
//  Bored
//
//  Created by Gabriel Sabanai on 22/04/25.
//

import XCTest
@testable import Bored

final class BoredServiceTests: XCTestCase {
    func testFetch_whenSuccess_returnsData() async throws {
        // given
        let json = """
        [
            {
                "activity": "Go for a walk",
                "type": "recreational",
                "participants": 1,
                "price": 0.1,
                "accessibility": "",
                "link": "",
                "key": ""
            }
        ]
        """.data(using: .utf8)!

        URLProtocolSpy.testData = json
        URLProtocolSpy.testError = nil

        let spySession = SessionSpy().makeSpySession()
        let sut = BoredService(session: spySession)

        // when
        let result = try await sut.fetch(type: "recreational")

        // then
        
        XCTAssertEqual(result.first?.activity, "Go for a walk")
        XCTAssertEqual(result.first?.type, "recreational")
    }

    func testFetch_whenFailure_throwsBoredError() async throws {
        // given
        URLProtocolSpy.testData = Data("INVALID JSON".utf8)
        URLProtocolSpy.testError = nil
        
        let spySession = SessionSpy().makeSpySession()
        let sut = BoredService(session: spySession)
        
        do {
            _ = try await sut.fetch(type: "recreational")
            XCTFail("Expected to throw Bored Error")
        } catch (let error) as BoredError {
            XCTAssertEqual(error.localizedDescription, "Erro na api: The data couldn’t be read because it isn’t in the correct format.")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testFetch_whenNoConnection_shouldThrowError() async throws {
        URLProtocolSpy.testError = URLError(.notConnectedToInternet)
        URLProtocolSpy.testData = nil
        
        let spySession = SessionSpy().makeSpySession()
        let sut = BoredService(session: spySession)
        
        do {
            _ = try await sut.fetch(type: "recreational")
            XCTFail("Expected to throw Bored Error")
        } catch {
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (NSURLErrorDomain error -1009.)")
        }
    }
}
