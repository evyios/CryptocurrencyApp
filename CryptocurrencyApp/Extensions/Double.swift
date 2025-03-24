//
//  Double.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 28.02.25.
//

import Foundation
import SwiftUI

extension Double {
      
    func currencyFormat() -> String {
        return String(format: "$ %.2f", self)
    }
    
    func percentageFormat() -> String {
        return String(format: "%.2f%%", self)
    }
}


extension String {
    
    func convertDateString() -> String? {
            return convert(dateString: self, fromDateFormat: "yyyy-MM-dd'T'HH:mm:mm.ssZ", toDateFormat: "MMM d, y")
        }

    
        func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {

            let fromDateFormatter = DateFormatter()
            fromDateFormatter.dateFormat = fromDateFormat

            if let fromDateObject = fromDateFormatter.date(from: dateString) {

                let toDateFormatter = DateFormatter()
                toDateFormatter.dateFormat = toDateFormat

                let newDateString = toDateFormatter.string(from: fromDateObject)
                return newDateString
            }

            return nil
        }
}

extension View {
    func dateFormat(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
