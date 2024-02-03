//
//  ForgotPassView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 24/10/23.
//

import SwiftUI

struct ForgotPassView: View {
    @StateObject private var forgotResetPassViewModel = ForgotResetPassViewModel()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Enter your registered email address in Bersinar before changing your password.")
                    .padding(.top, 12)
                InputView(text: $forgotResetPassViewModel.email, title: "", placeholder: "name@example.com")
                    .padding(.bottom, 12)
                
                Button {
                    Task {
                        do {
                            try await authViewModel.sendResetPassword(email: forgotResetPassViewModel.email)
                            forgotResetPassViewModel.isLinkSent = true
                        } catch {
                            forgotResetPassViewModel.showAlert = true
                            print(error)
                        }
                    }
                } label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text("Send Request")
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
            .navigationTitle("Forgot Password")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "arrow.left")
                    .foregroundColor(.secondary60)
            })
            .sheet(isPresented: $forgotResetPassViewModel.isLinkSent) {
                ResetPassView(email: forgotResetPassViewModel.email)
            }
            .alert(isPresented: $forgotResetPassViewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Could not send email to \(forgotResetPassViewModel.email)"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .alert(isPresented: $forgotResetPassViewModel.isLinkSent) {
                Alert(
                    title: Text("Email Sent"),
                    message: Text("Check your email to reset your password"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct ForgotPassView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassView()
    }
}
