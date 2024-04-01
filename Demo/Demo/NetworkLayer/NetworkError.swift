//
//  NetworkError.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case parsingError
    case dataNotFound
}

// MARK: - Creating the Custom Error Message.

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self{
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "invalidURL")
        case .parsingError:
            return NSLocalizedString("Encountered Parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
        }
    }
}
