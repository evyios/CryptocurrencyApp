//
//  SingleCoin.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.02.25.
//

import SwiftUI

struct SingleCoin: View {
    
    let coin: Coin
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.black)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 7)
            
            Spacer()
            
            HStack {
                Text(coin.price.currencyFormat())
                    .bold()
                    .foregroundStyle(.black)
                Text(coin.priceChangePercentage24H?.percentageFormat() ?? "")
                    .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color("darkGreen") : Color("darkRed"))
            }
        }
    }
}

#Preview {
    SingleCoin(coin: CoinPreview.instance.coin)
}
