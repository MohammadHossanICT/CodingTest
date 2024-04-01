//
//  EmployeeAsyncImageView.swift
//  Demo
//
//  Created by MohammadHossan on 01/04/2024.
//

import SwiftUI

struct EmployeeAsyncImageView: View {
    
    let url: URL
    private let imageWidth = 150.0
    private let cellHeight = 150.0
    
    var body: some View {
        CacheAsyncImage(
            url: url) { phase in
                switch phase {
                case .success(let image):
                    VStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                case .failure:
                    Image("placeholder-image")
                    
                case .empty:
                    HStack(alignment: .center) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                    }
                @unknown default:
                    Image("placeholder-image")
            }
        }
    }
}
