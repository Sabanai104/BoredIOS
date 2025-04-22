//
//  ViewModelService.swift
//  Bored
//
//  Created by Gabriel Sabanai on 22/04/25.
//
import XCTest
@testable import Bored

final class ViewModelTests: XCTestCase {
    func testFetch_whenIsSuccess_shouldUpdateViewState() {
        // given
        let service = BoredServiceSpy()
        let viewState = ViewStateSpy()
        let sut = ViewModel(service: service, viewState: viewState)

        let expectation = expectation(description: "Esperando boredInfo ser atualizado")

        viewState.onUpdate = {
            expectation.fulfill()
        }

        // when
        sut.fetch(type: "Narutin")

        wait(for: [expectation], timeout: 1.0)
        
        // then
        XCTAssertEqual(viewState.boredInfo?.type, "Narutin")
        XCTAssertEqual(viewState.boredInfo?.activity, "Narute")
    }

    func testFetch_whenIsFailure_shouldUpdateViewStateWithDefault() {
        // given
        let service = BoredServiceSpy()
        service.shouldFail = true
        let viewState = ViewStateSpy()
        let sut = ViewModel(service: service, viewState: viewState)

        let expectation = expectation(description: "Esperando boredInfo ser atualizado")

        viewState.onUpdate = {
            expectation.fulfill()
        }

        // when
        sut.fetch(type: "Narutin")

        wait(for: [expectation], timeout: 1.0)

        // then
        XCTAssertEqual(viewState.boredInfo?.type, "relaxation")
        XCTAssertEqual(viewState.boredInfo?.activity, "Take your dog on a walk")
    }
}
