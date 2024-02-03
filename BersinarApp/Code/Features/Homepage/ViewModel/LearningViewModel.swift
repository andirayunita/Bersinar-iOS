//
//  LearningViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 11/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class LearningViewModel: ObservableObject {
    @Published var bersinarLearnings = [BersinarLearning]()
    
    init() {
        Task.detached {
            await self.fetchBersinarLearnings()
            self.runRealTimeListenerEventClassesData()
        }
    }
    
    @MainActor
    func fetchBersinarLearnings() async {
        let db = Firestore.firestore()
        do {
            let querySnapshot = try await db.collection("learning").getDocuments()
            for document in querySnapshot.documents {
                let data = document.data()
                
                let id = data["id"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let subPoin = data["subPoin"] as? String ?? ""
                let subPoinDescription = data["subPoinDescription"] as? String ?? ""
                let tags = data["tags"] as? String ?? ""
                let link = data["link"] as? String ?? ""
                let subjectId = data["subjectId"] as? Int ?? 0
                let videoId = data["videoId"] as? String ?? ""
                
                let learning = BersinarLearning(id: id, title: title, description: description, subPoin: subPoin, subPoinDescription: subPoinDescription, tags: tags, link: link, subjectId: subjectId, videoId: videoId)
                self.bersinarLearnings.append(learning)
                
                print("\(document.documentID) => \(document.data())")
            }
//            DispatchQueue.main.async { [weak self] in
//                self?.bersinarLearnings = self?.bersinarLearnings ?? []
//            }
            print("Fetched \(self.bersinarLearnings.count) items")
        } catch {
            print("Error getting documents: \(error)")
        }
    }
    
    func runRealTimeListenerEventClassesData() {
        let db = Firestore.firestore()
        let docPath = db.collection("learning")
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
