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
                .frame(minWidth: 26)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.name)
                .font(.headline)
                .padding(.leading, 10)
            Text("・\(coin.symbol.uppercased())・")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.4))
                .padding(.leading, 4)
            Text(coin.priceChangePercentage24H?.percentageFormat() ?? "")
                .font(.subheadline)
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color("darkGreen") : Color("darkRed"))
                .padding(.leading, 15)
            
            Spacer()
            
                Text(coin.price.currencyFormat())
                    .bold()
                    .foregroundStyle(.black)
        }
    }
}

#Preview {
    SingleCoin(coin: CoinPreview.instance.coin)
}
