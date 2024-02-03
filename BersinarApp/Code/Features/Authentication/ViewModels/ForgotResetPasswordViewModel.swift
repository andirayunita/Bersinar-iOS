//
//  ForgotResetPasswordViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 10/01/24.
//

import Foundation

final class ForgotResetPassViewModel: ObservableObject {
    @Published var email = ""
    
    @Published var password = ""
    @Published var newPassword = ""
    @Published var confirmPassword = ""
    
    @Published var showAlert: Bool = false
    @Published var isResetPassViewActive = false
    @Published var isLinkSent = false
}
