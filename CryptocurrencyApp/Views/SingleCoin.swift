//
//  SingleCoin.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.02.25.
//

import SwiftUI
import CachedAsyncImage

struct SingleCoin: View {
    
    let coin: Coin
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.black)
                .frame(minWidth: 10)
            
            CachedAsyncImage(url: URL(string: coin.image), transaction: Transaction(animation: .easeInOut)) { item in
                if let image = item.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                } else {
                    HStack {
                        ProgressView()
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(coin.name)
                    .font(.headline)
                HStack(spacing: 20) {
                    Text("\(coin.symbol.uppercased()) ⎜")
                        .font(.subheadline)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    Text(coin.priceChangePercentage24H?.percentageFormat() ?? "")
                        .font(.subheadline)
                        .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color("darkGreen") : Color("darkRed"))
                        .padding(.leading, -15)
                }
            }
            .frame(width: UIScreen.main.bounds.width / 3, alignment: .leading)
            
            Spacer()
            
                Text(coin.price.currencyFormat())
                    .bold()
                    .foregroundStyle(.black)
        }
        .background {
            Color.black.opacity(0.001)
        }
    }
}

#Preview {
    SingleCoin(coin: CoinPreview.instance.coin)
}
