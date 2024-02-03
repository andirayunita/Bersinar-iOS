//
//  Double+Extension.swift
//  BersinarApp
//
//  Created by Andira Yunita on 05/01/24.
//

import Foundation

extension Double {
    func formatCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
