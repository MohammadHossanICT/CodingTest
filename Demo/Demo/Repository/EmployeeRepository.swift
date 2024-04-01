//
//  EmployeeRepository.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

protocol EmployeeCardsRepository {
    
    func getEmployeeList(for url: URL) async throws -> EmployeeListData
}

struct EmployeeRepositoryImplementation {
    
    private let networkManager: Fetchable
    
    init(networkManager: Fetchable) {
        self.networkManager = networkManager
    }
}

// MARK: - Employee Repository Implementation.
extension EmployeeRepositoryImplementation: EmployeeCardsRepository, JsonParser {
    
    func getEmployeeList(for url: URL) async throws -> EmployeeListData {
        do {
            let listsData = try await networkManager.get(url: url)
            return try parse(data: listsData, type: EmployeeListData.self)
        } catch {
            throw error
        }
    }
}
