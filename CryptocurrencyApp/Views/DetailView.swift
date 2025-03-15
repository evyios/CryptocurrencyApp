//
//  DetailView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 8.03.25.
//

import SwiftUI

struct DetailView: View {
    
    var coin: Coin
    
    @StateObject private var vm: DetailVM
    @EnvironmentObject var sharedData: SharedData
    
    init(coin: Coin) {
        self.coin = coin
        _vm = StateObject(wrappedValue: DetailVM(coin: coin))
    }
    
    var body: some View {
        VStack {
            VStack {
                header
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: CoinPreview.instance.coin)
    }
}

extension DetailView {
    private var header: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "arrow.left")
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "star")
            }
        }
        .font(.title2)
        .foregroundStyle(.black.opacity(0.8))
        .padding(10)
        .padding(.trailing,-2)
    }
}

// ZStack {
//if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
//    VStack(alignment: .leading) {
//        Text(coinDescription)
//            .lineLimit(3)
//            .font(.callout)
//        
//        Button {
//            
//        } label: {
//            Text("Read more...")
//                .font(.subheadline)
//                .fontWeight(.bold)
//                .padding(.vertical, 1)
//        }
//    }
//    .frame(maxWidth: .infinity, alignment: .leading)
//}
//}
