//
//  DetailView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 8.03.25.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var vm: DetailVM
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailVM(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("coin")
            }
        }
        .navigationTitle(vm.coin.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: CoinPreview.instance.coin)
    }
}
