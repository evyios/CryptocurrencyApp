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
            VStack(alignment: .leading, spacing: 5) {
                
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
                
                HStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        HStack(spacing: 10) {
                            Text("All Time High:")
                                .font(.subheadline)
                                .foregroundStyle(.black.opacity(0.4))
                            
                                Text(coin.ath?.currencyFormat() ?? "")
                                    .bold()
                    }
                        
                        HStack(spacing: 10) {
                            HStack {
                                Text("All Time Low:")
                                    .font(.subheadline)
                                    .foregroundStyle(.black.opacity(0.4))
                                
                                Text(coin.atl?.currencyFormat() ?? "")
                                    .bold()
                                Spacer()
                                Text(coin.atlDate?.convertDateString() ?? "")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                        }
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
                .padding(.top,40)
        }
    }
}

#Preview {
    DetailStatistics(coin: CoinPreview.instance.coin)
}
