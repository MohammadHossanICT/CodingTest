//
//  EmployeeViewModel.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import Foundation

enum ViewState {
    
    case load(employees: [Employee])
    case refresh
    case error
}

protocol EmployeeListViewModelAction: ObservableObject {
    
    func getEmployeeList(urlStr: String) async
}

// MARK: - Employee ViewModel Implementation.
@MainActor
final class EmployeeListViewModel {
    
    @Published var viewState = ViewState.load(employees: [])
    var isError = false
    private(set) var customError: NetworkError?
    private(set) var employeeLists: [Employee] = []
    private let repository: EmployeeCardsRepository
    
    init(repository: EmployeeCardsRepository) {
        self.repository = repository
    }
}

extension EmployeeListViewModel: EmployeeListViewModelAction {
    
    func getEmployeeList(urlStr: String) async {
        viewState = .refresh
        guard let url = URL(string: urlStr) else { return }
        do {
            let lists = try await repository.getEmployeeList(for: url)
            employeeLists = lists.employees
            viewState = .load(employees: employeeLists)
        } catch {
            isError = true
            viewState = .error
            customError = error as? NetworkError
        }
    }
}
