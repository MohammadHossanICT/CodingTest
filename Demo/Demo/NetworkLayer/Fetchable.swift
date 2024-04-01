//
//  Fetchable.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

// MARK: - Todo Protocol for GET with given URL .
protocol Fetchable {
    
    func get(url: URL) async throws -> Data
    
}
