//
//  Home.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI

struct Home: View {
    
    @StateObject var vm: HomeVM = .init()
    @EnvironmentObject var sharedData: SharedData
    @State private var activeTag: String = "All"
    
    @State private var searchText: String = ""
    var animation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 15) {
            HomeHeader()
            
            SearchField()
            
            Tags()
            
            columsName
            coinsList
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal,12)
        // Поскольку Tab Bar находится в ZStack
        .padding(.bottom, 52)

    }
    
    @ViewBuilder
    func HomeHeader() -> some View {
        HStack(spacing: 13) {
            Text("Cryptocurrency")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 3)
            
            Button {
                
            } label: {
                Image(systemName: "bell.badge.fill")
                    .renderingMode(.original)
                    .foregroundStyle(.gray)
                    .font(.title3)
                    .frame(width: 40, height: 40)
                    .background {
                        Circle()
                            .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    }
            }
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .frame(width: 40, height: 40)
                    .rotationEffect(Angle(degrees: 90))
                    .background {
                        Circle()
                            .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    }
            }
            
        }
    }
    
    @ViewBuilder
    func Tags() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.callout)
                        .foregroundStyle(activeTag == tag ? .white : .black.opacity(0.6))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background {
                            if activeTag == tag {
                                Capsule()
                                    .fill(Color("main"))
                                    .matchedGeometryEffect(id: "TAGS", in: animation)
                            } else {
                                Capsule()
                                    .fill(Color.gray.opacity(0.2))
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                activeTag = tag
                            }
                        }
                }
            }
            .padding(.horizontal, 3)
        }
    }
    
    @ViewBuilder
    func SearchField() -> some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.title3)
            
            Divider()
            
            TextField("Search something", text: $searchText)
        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        .frame(height: 45)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.2))
        }
    }
    
    var tags: [String] = ["All", "DeFi", "RWA", "Gaming", "DePin", "AI", "Meme"]
}
    
#Preview {
        ContentView()
           .environmentObject(CoinPreview.instance.homeVM)
}


extension Home {
    private var coinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                SingleCoin(coin: coin)
                    .listRowInsets(.init(top: 10, leading: 1, bottom: 10, trailing: 5))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            sharedData.showDetails = true
                            sharedData.tappedCoin = coin
                        }
                    }
            }
        }
        .listStyle(.plain)
    }
    
    private var columsName: some View {
        HStack {
            Text("#")
                
            Text("Name ⎜ 24h %")
                .frame(width: UIScreen.main.bounds.width / 2.2)
            Spacer()
            Text("Price")
        }
        .padding(3)
        .font(.caption)
        .foregroundStyle(.black.opacity(0.4))
    }
}
