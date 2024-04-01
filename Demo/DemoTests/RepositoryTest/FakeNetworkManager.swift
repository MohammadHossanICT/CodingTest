//
//  FakeNetworkManager.swift
//  DemoTests
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation
@testable import Demo

class FakeNetworkManager: Fetchable {
    
    func get(url: URL) async throws -> Data {
        
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
