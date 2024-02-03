//
//  HomepageViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 08/01/24.
//

import SwiftUI
import Firebase

class HomepageViewModel: ObservableObject {
    @Published var selectedCategory: CategoryOption? = .all
    @Published var filteredItems: [Item] = []
    
    struct Item: Identifiable {
        let id = UUID()
        let name: String
        let category: CategoryOption
    }
    
    let items: [Item] = [
        Item(name: "All", category: .all),
        Item(name: "Penalaran Umum", category: .pu),
        Item(name: "Pengetahuan & Pemahaman Umum", category: .ppu),
        Item(name: "Pemahaman Bacaan dan Menulis", category: .pbm),
        Item(name: "Penalaran Matematika", category: .pm),
    ]
    
    enum CategoryOption: String, CaseIterable {
        case all = "All"
        case pu = "Penalaran Umum"
        case ppu = "Pengetahuan & Pemahaman Umum"
        case pbm = "Pemahaman Bacaan dan Menulis"
        case pm = "Penalaran Matematika"
    }
    
    func filterItems() {
        if selectedCategory == .all {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.category == selectedCategory }
        }
    }
    
    func subjectCategoryFiltered(category: CategoryOption) async {
        //        let db = Firestore.firestore()
        //        let docPath = db.collection("learning").whereField("subjectId", isEqualTo: subjectId)
        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("learning")
                .whereField("subjectId", isEqualTo: numericSubjectId(for: category))
                .getDocuments()
            
            for document in querySnapshot.documents {
                print("\(document.documentID) => \(document.data())")
            }
        } catch {
            print("Error getting documents: \(error)")
        }
    }
    
    func numericSubjectId(for category: CategoryOption) -> Int {
        switch category {
        case .all: return 0
        case .pu: return 1
        case .ppu: return 2
        case .pbm: return 3
        case .pm: return 4
        }
    }
}
