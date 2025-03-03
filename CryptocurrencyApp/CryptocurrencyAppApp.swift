//
//  CryptocurrencyAppApp.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI

@main
struct CryptocurrencyAppApp: App {
    
    @StateObject private var vm: HomeVM = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
