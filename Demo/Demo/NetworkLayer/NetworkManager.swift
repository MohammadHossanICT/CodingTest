//
//  NetworkManager.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

struct NetworkManager {
    
    private let urlSession: Networking
    init(urlSession: Networking = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: Fetchable {
    
    // MARK: - Return Employee Url.
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await urlSession.data(form: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
