//
//  LoginViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 10/10/23.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = "Your email & password is unmatched or not registered!"
    
    func signin() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
    }
}
