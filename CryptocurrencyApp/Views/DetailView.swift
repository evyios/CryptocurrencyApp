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
    
    @State private var showFullDescription: Bool = false
    
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
                               .lineLimit(showFullDescription ? nil : 3)
                               .font(.callout)
                               .foregroundStyle(.gray)
                           
                           Button {
                               withAnimation(.easeInOut) {
                                   showFullDescription.toggle()
                               }
                           } label: {
                               Label {
                                   Image(systemName: showFullDescription ? "" : "arrow.right")
                               } icon: {
                                   Text(showFullDescription ? "Hide" : "Full Description")
                                       .font(.subheadline)
                                       .fontWeight(.bold)
                                       .padding(.vertical, 1)
                               }
                           }
                           .tint(.blue)
                       }
                       .frame(maxWidth: .infinity, alignment: .leading)
                   }
                }
                    
                    DetailStatistics(coin: coin)
                        .padding(.top,13)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Add to Watchlist")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color("main")
                                    .cornerRadius(20)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                            )
                            .padding(.vertical,25)
                    }
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
