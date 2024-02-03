//
//  RegisterView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var registerViewModel = RegisterViewModel()
    @State private var isRegistered = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 32) {
                Spacer()
                Image("logobersinar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                VStack(spacing: 24) {
                    InputView(text: $registerViewModel.email,
                              title: "Email",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    
                    InputView(text: $registerViewModel.fullname,
                              title: "Full Name",
                              placeholder: "Enter you full name")
                    .autocorrectionDisabled()
                    
                    InputView(text: $registerViewModel.password,
                              title: "Password",
                              placeholder: "Enter your password", isSecureField: true)
                    
                    InputView(text: $registerViewModel.confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Re-enter your password", isSecureField: true)
                }
                .padding(.horizontal, 16)
                Button {
                    Task {
                        do {
                            try await authViewModel.createUser(withEmail: registerViewModel.email,
                                                               password: registerViewModel.password,
                                                               fullname: registerViewModel.fullname)
                            isRegistered = true
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("Error registering user: \(error.localizedDescription)")
                        }
                        
                    }
                } label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text("Register")
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
                Divider()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Text("Login")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 14))
                }
            }
        }
        .overlay(isRegistered ? ProgressView() : nil)
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
