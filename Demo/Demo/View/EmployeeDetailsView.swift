//
//  DetailsView.swift
//  Demo
//
//  Created by MohammadHossan on 02/04/2024.
//

import SwiftUI

struct EmployeeDetailsView: View {
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
        .padding(10)
    }
}

#Preview {
    EmployeeDetailsView(employee: Constants.previewEmployeeObj)
}
