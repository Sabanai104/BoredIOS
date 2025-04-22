//
//  BoredFactory.swift
//  Bored
//
//  Created by Gabriel Sabanai on 21/04/25.
//
import Foundation

final class BoredFactory {
    func make(activityType: String) -> ActivityDetails {
        let session = URLSession(configuration: .default)
        let service = BoredService(session: session)
        let viewState = ViewState()
        let viewModel = ViewModel(service: service, viewState: viewState)

        return ActivityDetails(viewState: viewState, viewModel: viewModel, activityType: activityType)
    }
}
