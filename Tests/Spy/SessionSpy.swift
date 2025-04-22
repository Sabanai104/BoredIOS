//
//  SessionSpy.swift
//  Bored
//
//  Created by Gabriel Sabanai on 22/04/25.
//

import Foundation

final class SessionSpy  {
    func makeSpySession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolSpy.self]

        return URLSession(configuration: configuration)
    }
}
