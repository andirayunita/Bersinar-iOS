//
//  User.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import Foundation
import FirebaseAuth

struct UserModel: Encodable {
    let uid: String
    let fullname: String
    let email: String?
    let image: String?
    let isStudent: Bool?
    let phoneNumber: String?
    let grade: [Grade]?
    let dateCreated: Date
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    init(user: User, isStudent: Bool = true, grades: [Grade]? = nil) {
        self.uid = user.uid
        self.email = user.email ?? ""
        self.fullname = user.displayName ?? ""
        self.image = user.photoURL?.absoluteString
        self.phoneNumber = user.phoneNumber
        self.isStudent = isStudent
        self.grade = grades
        self.dateCreated = Date()
    }
    
    enum CodingKeys: String, CodingKey {
        case uid, fullname, email, image, isStudent, phoneNumber, grade, initials, dateCreated
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uid = try container.decode(String.self, forKey: .uid)
        self.isStudent = try container.decodeIfPresent(Bool.self, forKey: .isStudent)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname) ?? ""
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.grade = try container.decodeIfPresent([Grade].self, forKey: .grade)
//        self.initials = try container.decode(String.self, forKey: .initials)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uid, forKey: .uid)
        try container.encode(fullname, forKey: .fullname)
        try container.encode(email, forKey: .email)
        try container.encode(image, forKey: .image)
        try container.encode(isStudent, forKey: .isStudent)
        try container.encode(phoneNumber, forKey: .phoneNumber)
//        try container.encode(grade, forKey: .grade)
        try container.encode(initials, forKey: .initials)
        try container.encode(dateCreated, forKey: .dateCreated)
    }
}

//struct Grade: Encodable {
//    let name: String?
//    let level: Int?
//}
