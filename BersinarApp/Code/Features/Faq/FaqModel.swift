//
//  FaqModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/11/23.
//

import Foundation

struct FAQ: Identifiable {
    var id = UUID()
    var question: String
    var answer: String
}
