//
//  LoginView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    @State private var isRegisterActive = false
    @State private var isLoggingIn = false
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 32) {
                Spacer()
                Image("logobersinar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                VStack(spacing: 24) {
                    InputView(text: $loginViewModel.email,
                              title: "Email",
                              placeholder: "name@example.com")
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    InputView(text: $loginViewModel.password,
                              title: "Password",
                              placeholder: "Enter your password", isSecureField: true)
                    
                    NavigationLink(destination: ForgotPassView()) {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary60)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.horizontal, 16)
                
                Button {
                    Task {
                        isLoggingIn = true
                        do {
                            try await authViewModel.signIn(withEmail: loginViewModel.email, password: loginViewModel.password)
                            showSignInView = false
                        } catch {
                            loginViewModel.showAlert = true
                            print(error)
                        }
                        do {
                            isLoggingIn = false
                        }
                    }
                } label: {
                    HStack(alignment: .center, spacing: 8) {
                        Text("Login")
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
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Text("Register")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 14))
                }
            }
        }
        .overlay(isLoggingIn ? ProgressView() : nil)
        .alert(isPresented: $loginViewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(loginViewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showSignInView: .constant(false))
    }
}
