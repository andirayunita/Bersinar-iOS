//
//  UserManager.swift
//  BersinarApp
//
//  Created by Andira Yunita on 11/01/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Codable {
    let userId: String
    let isStudent: Bool?
    let email: String?
    let fullname: String?
    let image: String?
    let phoneNumber: String?
    let dateCreated: Date?
    
    init(auth: UserModel) {
        self.userId = auth.uid
        self.fullname = auth.fullname
        self.isStudent = auth.isStudent
        self.email = auth.email
        self.image = auth.image
        self.dateCreated = Date()
        self.phoneNumber = nil
    }
    
    init(
        userId: String,
        isStudent: Bool? = true,
        fullname: String? = nil,
        email: String? = nil,
        image: String? = nil,
        phoneNumber: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.userId = userId
        self.isStudent = isStudent
        self.fullname = fullname
        self.email = email
        self.image = image
        self.dateCreated = dateCreated
        self.phoneNumber = phoneNumber
    }
    
    enum CodingKeys: String, CodingKey {
        case userId
        case isStudent
        case email
        case fullname
        case image
        case phoneNumber
        case dateCreated
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.isStudent = try container.decodeIfPresent(Bool.self, forKey: .isStudent)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.isStudent, forKey: .isStudent)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.fullname, forKey: .fullname)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
    }
}

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    private let userCollection: CollectionReference = Firestore.firestore().collection("users")
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()

    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        return decoder
    }()
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
}
