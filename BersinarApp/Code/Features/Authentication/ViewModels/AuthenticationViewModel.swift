//
//  AuthenticationViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestoreInternal

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            try fetchUser()
        }
    }
    
    // MARK: - Login
    @discardableResult
    func signIn(withEmail email: String, password: String) async throws -> UserModel {
        do {
            print("Signin in..")
            let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = authDataResult.user
            self.currentUser = UserModel(user: authDataResult.user)
            return UserModel(user: authDataResult.user)
        } catch {
            throw error
        }
    }
    
    // MARK: - Register
    @discardableResult
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> UserModel {
        do {
            print("Regist create user")
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Created user \(authDataResult.user.uid)")
            self.userSession = authDataResult.user
            
            let changeRequest = authDataResult.user.createProfileChangeRequest()
            changeRequest.displayName = fullname
            try await changeRequest.commitChanges()
            
            let user = UserModel(user: authDataResult.user)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.uid).setData(encodedUser)
            
            return user
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    // MARK: - Delete Account
    func deleteAccount() async throws {
        print("Deleting account..")
        guard let user = Auth.auth().currentUser else { return }
        
        let db = Firestore.firestore()
        let userDocumentRef = db.collection("users").document(user.uid)
        self.userSession = nil
        self.currentUser = nil
        
        do {
            // Delete user from Firebase Auth
            try await user.delete()
            // Delete user's document from Firestore
            try await userDocumentRef.delete()
        } catch let error {
            print("Error deleting account: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Fetch User
    func fetchUser() throws -> UserModel {
        print("Fetching user..")
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        let userModel = UserModel(user: user)
        self.currentUser = userModel
        return userModel
    }
    
    // MARK: - Logout
    func signOut() throws {
        print("Signin out..")
        do {
            self.userSession = nil
            self.currentUser = nil
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    // MARK: - Reset Password
    func sendResetPassword(email: String) async throws {
        do {
            print("sending reset pass..")
            try await Auth.auth().sendPasswordReset(withEmail: email.lowercased())
        } catch {
            print("DEBUG: Could not send email with error \(error.localizedDescription)")
            throw error
        }
    }
    
    func sendSignInLink(email: String) async throws {
        do {
            print("sending link to email..")
            let actionCodeSettings = ActionCodeSettings()
            actionCodeSettings.handleCodeInApp = true
            actionCodeSettings.url = URL(string: "https://bersinarapp.page.link/open")
            actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
            
            try await Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings)
        } catch {
            print("DEBUG: Failed to send link to email with error \(error.localizedDescription)")
            throw error
        }
    }
    
    func updatePassword(password: String) async throws {
        print("updating pass..")
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    
    // MARK: - Update Email
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updateEmail(to: email)
    }
}

