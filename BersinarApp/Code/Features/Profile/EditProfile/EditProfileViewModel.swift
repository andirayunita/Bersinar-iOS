//
//  EditProfileViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 24/10/23.
//

import Foundation

enum Grade: Decodable {
    case freshman
    case sophomore
    case senior
    case others
}

class EditProfileViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var age = ""
    @Published var selectedGrade: Grade = .freshman
    
}
