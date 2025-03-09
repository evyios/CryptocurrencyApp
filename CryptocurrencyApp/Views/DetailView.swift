//
//  DetailView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 8.03.25.
//

import SwiftUI

struct DetailView: View {
    
    let coin: Coin?
    
    var body: some View {
        VStack {
            Text(coin?.name ?? "")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background {
            Color.white
        }
    }
}

#Preview {
    DetailView(coin: CoinPreview.instance.coin)
}
