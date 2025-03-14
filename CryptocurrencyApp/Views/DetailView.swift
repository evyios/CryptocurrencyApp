//
//  DetailView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 8.03.25.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var vm: DetailVM
    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailVM(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("")
                    .frame(height: 150)
                
                Text("Overview")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                ZStack {
                    if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                        Text(coinDescription)
                    }
                }
                
                LazyVGrid(columns: columns,
                          alignment: .center,
                          spacing: 30) {
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                }
                
                
                Text("Additional Information")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: CoinPreview.instance.coin)
    }
}
