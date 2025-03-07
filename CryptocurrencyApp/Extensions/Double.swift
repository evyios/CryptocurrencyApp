//
//  Double.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 28.02.25.
//

import Foundation

extension Double {
      
    func currencyFormat() -> String {
        return String(format: "$ %.2f", self)
    }
    
    func percentageFormat() -> String {
        return String(format: "%.2f%%", self)
    }
}
