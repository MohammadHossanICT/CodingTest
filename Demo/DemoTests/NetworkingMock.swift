//
//  NetworkingMock.swift
//  DemoTests
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation
@testable import Demo

class NetworkingMock: Networking {
    
    static var data: Data?

    func data(from url: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
}
