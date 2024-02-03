//
//  InputView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
              .font(
                Font.custom("Public Sans", size: 14)
                  .weight(.semibold)
              )
              .kerning(0.112)
              .foregroundColor(.neutral100)
            
            HStack(alignment: .center, spacing: 8) {
                if isSecureField {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 14))
                } else {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.neutral10)
            .cornerRadius(6)
            .overlay(
              RoundedRectangle(cornerRadius: 6)
                .inset(by: 0.5)
                .stroke(Color.neutral50, lineWidth: 1)
            )
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email", placeholder: "name@example.com")
    }
}
