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
                            NavigationLink(destination: EmployeeDetailsView(employee: employeeList)) {
                                EmployeeCellView(employee: employeeList)
                            }
                        }
                    }
                case .refresh:
                    progressView()
                case .error:
                    alertView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    getToolBarView()
                }
            }
            .navigationTitle(Text("Employees List"))
        }
        .task {
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
    
    @ViewBuilder
    func getToolBarView() -> some View {
        Button {
            Task {
                await getDataFromAPI()
            }
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise")
                    .padding(.all, 10.0)
            }.fixedSize()
        }
        .cornerRadius(5.0)
    }
}

#Preview {
    EmployeeListView(viewModel: EmployeeListViewModel(repository: EmployeeRepositoryImplementation(networkManager: NetworkManager())))
}
