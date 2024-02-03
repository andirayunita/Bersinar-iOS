//
//  RegistClass.swift
//  BersinarApp
//
//  Created by Andira Yunita on 04/01/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class RegistClassViewModel: ObservableObject {
    @Published var email = ""
    @Published var fullname = ""
    @Published var phoneNumber = ""
    @Published var usernameX = ""
    @Published var usernameIg = ""
    
    @Published var registClasses = [RegistClassModel]()
    let db = Firestore.firestore()
    let currentUserUID = Auth.auth().currentUser?.uid ?? ""
    
    init() {
        runRealTimeListenerClassData()
    }

    func addRegistClass(email: String, fullname: String, phoneNumber: String, usernameX: String, usernameIg: String) {
        let docPath = db.collection("users").document(currentUserUID).collection("RegistClass")
        docPath.document().setData([
            "id": UUID().uuidString,
            "email": email,
            "phoneNumber": phoneNumber,
            "usernameX": usernameX,
            "usernameIg": usernameIg,
            "dateCreated": Date()
        ], merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        let docPath2 = db.collection("event").document(currentUserUID).collection("RegistClass")
        docPath2.document().setData([
            "id": UUID().uuidString,
            "email": email,
            "phoneNumber": phoneNumber,
            "usernameX": usernameX,
            "usernameIg": usernameIg,
            "dateCreated": Date()
        ], merge: true) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        print("Write event classes \(self.registClasses.count) items")
    }
    
    func runRealTimeListenerClassData() {
        let docPath = db.collection("event")
        docPath.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let documents = documentSnapshot?.documents else {
                print("Document data was empty.")
                return
            }
            
            for document in documents {
                let documentData = document.data()
                print("Document ID: \(document.documentID)")
                print("Data: \(documentData)")
            }
        }
    }
}

struct RegistClassModel: Hashable, Identifiable {
    let id: String
    let email: String
    let fullname: String
    let phoneNumber: String
    let usernameX: String
    let usernameIg: String
}
