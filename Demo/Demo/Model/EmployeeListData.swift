//
//  EmployeeListData.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

// MARK: - EmployeeListData
struct EmployeeListData: Decodable {
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Decodable, Hashable {
    let uuid: String
    let fullName: String
    let phoneNumber: String
    let photoUrlSmall: String
    let team: String
}
