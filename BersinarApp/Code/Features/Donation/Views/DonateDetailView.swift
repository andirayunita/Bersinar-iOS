//
//  DonateDetailView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 05/01/24.
//

import SwiftUI

struct DonateDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var amount: Double = 0.0
    var description = ""
    var image: UIImage = UIImage(systemName: "photo")!
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
//                Rectangle()
//                    .foregroundColor(Color.gray)
//                    .frame(maxWidth: 250, minHeight: 150, maxHeight: 350)
//                    .overlay(
//                        Image("\(image)")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(.white)
//                    )
//                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Amount")
                        .font(Font.custom("Public Sans", size: 16).weight(.heavy))
                        .foregroundStyle(Color.secondary80)
                    
                    Text("\(amount.formatCurrency())")
                        .font(Font.custom("Public Sans", size: 14))
                    
                    Text("Description")
                        .font(Font.custom("Public Sans", size: 16).weight(.heavy))
                        .foregroundStyle(Color.secondary80)
                    
                    Text("\(description)")
                        .font(Font.custom("Public Sans", size: 14))
                    
                    Text("Date of Donation")
                        .font(Font.custom("Public Sans", size: 16).weight(.heavy))
                        .foregroundStyle(Color.secondary80)
                    
                    Text("12 Januari 2024")
                        .font(Font.custom("Public Sans", size: 14))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary80, lineWidth: 1)
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Donation Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(Color.primary80)
        })
    }
}

#Preview {
    DonateDetailView()
}
