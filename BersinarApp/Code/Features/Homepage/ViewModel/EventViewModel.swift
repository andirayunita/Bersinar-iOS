//
//  EventViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 11/01/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class EventViewModel: ObservableObject {
    @Published var eventClasses = [Event]()
    
    init() {
        Task.detached {
            await self.fetchEventClasses()
            self.runRealTimeListenerEventClassesData()
        }
    }
    
    @MainActor
    func fetchEventClasses() async {
        let db = Firestore.firestore()
        do {
            let querySnapshot = try await db.collection("event").getDocuments()
            for document in querySnapshot.documents {
                let data = document.data()
                
                let id = data["id"] as? String ?? ""
                let eventTitle = data["eventTitle"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let typeOfEvent = data["typeOfEvent"] as? String ?? ""
                let tutorName = data["tutorName"] as? String ?? ""
                let date = data["date"] as? String ?? ""
                let time = data["time"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let tutorPhoto = data["tutorPhoto"] as? String ?? ""
                let tutorDescription = data["tutorDescription"] as? String ?? ""
                
                let eventClass = Event(id: id, eventTitle: eventTitle, typeOfEvent: typeOfEvent, tutorName: tutorName, date: date, time: time, image: image, description: description, tutorPhoto: tutorPhoto, tutorDescription: tutorDescription)
                self.eventClasses.append(eventClass)
                
                print("\(document.documentID) => \(document.data())")
            }
            print("Fetched event classes \(self.eventClasses.count) items")
        } catch {
            print("Error getting documents event: \(error)")
        }
    }
    
    func runRealTimeListenerEventClassesData() {
        let db = Firestore.firestore()
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
