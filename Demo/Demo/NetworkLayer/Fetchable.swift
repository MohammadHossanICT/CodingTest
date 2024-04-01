//
//  Fetchable.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

// MARK: - Protocol for GET Employee with given URL .
protocol Fetchable {
    
    func get(url: URL) async throws -> Data
}
