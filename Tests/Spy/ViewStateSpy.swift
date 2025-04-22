//
//  ViewStateSpy.swift
//  Bored
//
//  Created by Gabriel Sabanai on 22/04/25.
//

@testable import Bored
import Foundation

final class ViewStateSpy: ViewStateProtocol {
    @Published var boredInfo: Bored.BoredAPI? {
        didSet {
            onUpdate?()
        }
    }

    var onUpdate: (() -> Void)?
}
