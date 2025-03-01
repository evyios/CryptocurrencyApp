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
            Text(coin.name)
                .font(.headline)
                .padding(.leading, 7)
            Text("・\(coin.symbol.uppercased())・")
                .font(.subheadline)
                .padding(.leading, 5)
            Text(coin.priceChangePercentage24H?.percentageFormat() ?? "")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color("darkGreen") : Color("darkRed"))
                .padding(.leading, 10)
            
            Spacer()
            
                Text(coin.price.currencyFormat())
                    .bold()
                    .foregroundStyle(.black)
        }
        .padding(.trailing)
    }
}

#Preview {
    SingleCoin(coin: CoinPreview.instance.coin)
}
