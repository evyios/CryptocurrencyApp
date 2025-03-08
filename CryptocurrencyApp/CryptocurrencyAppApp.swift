//
//  CryptocurrencyAppApp.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI

@main
struct CryptocurrencyAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .toolbar(.hidden)
            }
        }
    }
}
