//
//  FaqViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/11/23.
//

import Foundation

class FAQViewModel: ObservableObject {
    @Published var faqData: [FAQ] = []
    
    init() {
        faqData = [
            FAQ(question: "What is the Bersinar Project?", answer: "Bersinar Project is a non-profit educational organization founded in December 2020 by a group of Indonesian students."),
            FAQ(question: "What is the main objective of the Bersinar Project?", answer: "The main goal of the Bersinar Project is to assist other students in preparing for college entrance exams."),
            FAQ(question: "How does Bersinar Project provide educational support?", answer: "Bersinar Project provides high-quality education through free online classes, various learning materials, educational events, and mentoring for students all over Indonesia."),
            FAQ(question: "What kind of activities does the Bersinar Project organize?", answer: "The organization conducts educational events and offers mentoring programs to further support students in their educational journey."),
            FAQ(question: "How many volunteers are part of the Bersinar Project's team?", answer: "The Bersinar Project boasts a team of over 100+ volunteers dedicated to their mission."),
            FAQ(question: "How can students benefit from the Bersinar Project?", answer: "Students can benefit from free online classes, access to a wide range of learning materials, and the opportunity to participate in educational events and receive mentorship."),
        ]
    }
}
