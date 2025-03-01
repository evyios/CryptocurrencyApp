//
//  Double.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 28.02.25.
//

import Foundation

extension Double {
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    func currencyFormat() -> String {
        
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? "$0.00"
    }
}
