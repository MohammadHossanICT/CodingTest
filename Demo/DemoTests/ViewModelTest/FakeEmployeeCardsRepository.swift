//
//  FakeEmployeeCardsRepository.swift
//  DemoTests
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation
@testable import Demo

class FakeEmployeeCardsRepository: EmployeeCardsRepository {
    
    func getEmployeeList(for url: URL) async throws -> Demo.EmployeeListData {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let lists = try decoder.decode(EmployeeListData.self, from: data )
            return lists
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
