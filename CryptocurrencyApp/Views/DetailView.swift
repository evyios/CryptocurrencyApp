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
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                
            }
            .frame(height: UIScreen.main.bounds.height / 2.7)
            .zIndex(1)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    ZStack {
                   if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                       VStack(alignment: .leading) {
                           Text(coinDescription)
                               .lineLimit(3)
                               .font(.callout)
                               .foregroundStyle(.gray)
                           
                           Button {
                               
                           } label: {
                               Label {
                                   Image(systemName: "arrow.right")
                               } icon: {
                                   Text("Read more")
                                       .font(.subheadline)
                                       .fontWeight(.bold)
                                       .padding(.vertical, 1)
                               }
                           }
                           .foregroundStyle(.main)
                       }
                       .frame(maxWidth: .infinity, alignment: .leading)
                   }
                }
                    
                    DetailStatistics(coin: coin)
                        .padding(.top,13)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal,.bottom],20)
                .padding(.top,25)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.white
                    .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            }
            .zIndex(0)
        }
        .background(Color("background"))
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
            
            Text(coin.name)
                .font(.title)
                .bold()
                .padding(.leading,25)
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "star")
            }
        }
        .font(.title2)
        .foregroundStyle(.black.opacity(0.8))
        .padding(10)
        .padding(.trailing,2)
    }
}
