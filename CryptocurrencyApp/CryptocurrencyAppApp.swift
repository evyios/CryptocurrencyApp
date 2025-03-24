//
//  CryptocurrencyAppApp.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI
import SwiftData

@main
struct CryptocurrencyAppApp: App {
    
    var body: some Scene {
        WindowGroup {
                ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
