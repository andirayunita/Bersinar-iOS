//
//  RegisterViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 24/10/23.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var fullname = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    func signup() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
    }
}
