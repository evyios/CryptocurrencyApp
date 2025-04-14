//
//  Expense.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 23.03.25.
//

import Foundation
import SwiftData

@Model
class Expense {
    var title: String
    var subTitle: String
    var amount: Double
    var date: Date
    
    init(title: String, description: String, amount: Double, date: Date) {
        self.title = title
        self.subTitle = description
        self.amount = amount
        self.date = date
    }
}
