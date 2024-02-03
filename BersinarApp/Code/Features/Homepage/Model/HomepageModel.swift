//
//  HomepageModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 11/01/24.
//

import Foundation

struct BersinarLearning: Hashable, Identifiable {
    var id: String
    var title: String
    var description: String
    var subPoin: String
    var subPoinDescription: String
    var tags: String
    let link: String?
    let subjectId: Int
    let videoId: String?
}

struct Event: Hashable, Identifiable {
    let id: String
    let eventTitle: String
    let typeOfEvent: String
    let tutorName: String
    let date: String
    let time: String
    let image: String
    
    let description: String
    let tutorPhoto: String
    let tutorDescription: String
}

