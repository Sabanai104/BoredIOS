//
//  URLProtocolSpy.swift
//  Bored
//
//  Created by Gabriel Sabanai on 22/04/25.
//

import Foundation

final class URLProtocolSpy: URLProtocol {
    static var testData: Data?
    static var testError: Error?
    static var response: URLResponse?

    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        if let error = URLProtocolSpy.testError {
            client?.urlProtocol(self, didFailWithError: error)
        } else {
            let response = URLProtocolSpy.response ?? HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!

            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            if let data = URLProtocolSpy.testData {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        }
    }

    override func stopLoading() {}
}
