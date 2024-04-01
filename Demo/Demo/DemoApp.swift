//
//  DemoApp.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import SwiftUI

@main
struct DemoApp: App {
// MARK: - Creating Employee List View with view model Repository and NetworkManager .
    
    var body: some Scene {
        WindowGroup {
           EmployeeListView(viewModel: EmployeeListViewModel(repository: EmployeeRepositoryImplementation(networkManager: NetworkManager())))
        }
    }
}
