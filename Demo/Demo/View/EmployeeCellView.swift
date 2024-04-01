//
//  EmployeeCellView.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import SwiftUI

struct EmployeeCellView: View {
    let employee: Employee
    var body: some View {
        HStack {
            if let url = URL(string: employee.photoUrlSmall) {
                EmployeeAsyncImageView(url: url)
                    .frame(width: 150, height: 150)
                    .mask(RoundedRectangle(cornerRadius: 16))
            }
            
            VStack(alignment: .leading,spacing: 5) {
                Text("Name: " + employee.fullName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Text("Phone Number: " + employee.phoneNumber)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("Team: " + employee.team)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    EmployeeCellView(employee: Constants.previewEmployeeObj)
}
