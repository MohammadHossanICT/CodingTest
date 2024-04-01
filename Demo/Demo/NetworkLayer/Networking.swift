//
//  Networking.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

protocol Networking {
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension Networking {
    
    // MARK: - Employee url Request.
    func data(form url: URL) async throws -> (Data, URLResponse) {
        try await data(from: url, delegate: nil)
    }
}

extension URLSession: Networking {}
