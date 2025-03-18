//
//  DetailStatistics.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 15.03.25.
//

import SwiftUI

struct DetailStatistics: View {
    
    let coin: Coin
    
    var body: some View {
            VStack(alignment: .leading, spacing: 7) {
                
                HStack(spacing: 10) {
                    Text("Current price:")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    Text(coin.price.currencyFormat())
                        .bold()
                }
                
                HStack(spacing: 10) {
                    Text("Rank:")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    Text("\(coin.rank)")
                        .bold()
                }
                
                HStack(spacing: 10) {
                    Text("Market Capitalization:")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    Text(coin.marketCap?.currencyFormat() ?? "")
                        .bold()
                }
                
                HStack(spacing: 10) {
                    Text("Price change 24h:")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    Text(coin.priceChangePercentage24H?.percentageFormat() ?? "")
                        .bold()
                        .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color("darkGreen") : Color("darkRed"))
                }
                
                HStack(spacing: 10) {
                    Text("All Time High:")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                        Text(coin.ath?.currencyFormat() ?? "")
                            .bold()
            }
                .padding(.top,25)
                
                HStack(spacing: 10) {
                    Text("All Time Low:")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    Text(coin.atl?.currencyFormat() ?? "")
                            .bold()
            }
        }
    }
}

#Preview {
    DetailStatistics(coin: CoinPreview.instance.coin)
}
