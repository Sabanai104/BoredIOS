//
//  ViewState.swift
//  Bored
//
//  Created by Gabriel Sabanai on 21/04/25.
//
import Foundation

public protocol ViewStateProtocol: ObservableObject {
    var boredInfo: BoredAPI? { get set }
}

final class ViewState: ViewStateProtocol {
    @Published var boredInfo: BoredAPI? = nil
}
