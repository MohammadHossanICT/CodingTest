//
//  EmployeeListView.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import SwiftUI

struct EmployeeListView: View {
    // MARK: - Using State Object to make sure view model object will not destroyed or recreate.
    @StateObject var viewModel: EmployeeListViewModel
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.viewState {
                case.load(employees: let employees):
                    List {
                        ForEach(employees, id: \.self) { employeeList in
                            EmployeeCellView(employee: employeeList)
                        }
                    }
                case .refresh:
                    progressView()
                case .error:
                    alertView()
                }
            }
            .navigationTitle(Text("Employees List"))
        }
        .task{
            await getDataFromAPI()
        }
        .refreshable {
            await getDataFromAPI()
        }
    }
    
    // MARK: - Making API call call URL .
    func getDataFromAPI() async {
        await viewModel.getEmployeeList(urlStr: Endpoint.employeeUrl)
    }
    
    // MARK: - Using ViewBuilder to create the child view.
    @ViewBuilder
    func progressView() -> some View {
        VStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(height: 180)
                .overlay {
                    VStack{
                        ProgressView().padding(50)
                        Text("Please Wait Message").font(.headline)
                }
            }
        }
    }
    
    @ViewBuilder
    func alertView() -> some View {
        Text("").alert(isPresented: $viewModel.isError) {
            Alert(title: Text("General_Error"), message: Text(viewModel.customError?.localizedDescription ?? ""),dismissButton: .default(Text("Okay")))
        }
    }
}

#Preview {
    EmployeeListView(viewModel: EmployeeListViewModel(repository: EmployeeRepositoryImplementation(networkManager: NetworkManager())))
}