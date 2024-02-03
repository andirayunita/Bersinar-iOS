//
//  ResetPassView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 24/10/23.
//

import SwiftUI

struct ResetPassView: View {
    @StateObject private var forgotResetPassViewModel = ForgotResetPassViewModel()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let email: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Enter a new password to reset password on your account")
                    .padding(.top, 8)
                InputView(text: $forgotResetPassViewModel.newPassword, title: "", placeholder: "Input your new password")
                InputView(text: $forgotResetPassViewModel.confirmPassword, title: "", placeholder: "Confirm your new password")
                    .padding(.bottom, 12)
                
                Button {
                    Task {
                        do {
                            guard forgotResetPassViewModel.newPassword == forgotResetPassViewModel.confirmPassword else {
                                return
                            }
                            try await authViewModel.updatePassword(password: forgotResetPassViewModel.newPassword)
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            forgotResetPassViewModel.showAlert = true
                            print(error)
                        }
                    }
                } label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text("Done")
                            .font(
                                Font.custom("Public Sans", size: 14)
                                    .weight(.semibold))
                    }
                    .foregroundColor(Color.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 36)
                }
                .background(Color.primary50)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.5)
                        .stroke(Color.primary70))
                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle("Reset Password")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ResetPassView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassView(email: "")
    }
}
