//
//  DonateViewModel.swift
//  BersinarApp
//
//  Created by Andira Yunita on 28/11/23.
//

import Foundation

class DonationViewModel: ObservableObject {
//    @Published var donations: [DonateModel] = []
//    @Published var isAddingDonation = false
    @Published var source: NavigationSource = .tab

    enum NavigationSource {
        case profileView
        case tab
    }


//    func addDonation(amount: Double) {
//        let newDonation = DonateModel(amount: amount, date: Date())
//        donations.append(newDonation)
//    }
}
