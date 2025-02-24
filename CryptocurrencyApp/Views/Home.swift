//
//  Home.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                HomeHeader()
            }
            .padding(15)
            // Поскольку Tab Bar находится в ZStack
            .padding(.bottom, 50)
        }
        .padding(.bottom, 5)
    }
    
    @ViewBuilder
    func HomeHeader() -> some View {
        HStack(spacing: 13) {
            Text("Cryptocurrency")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            
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
}

#Preview {
    ContentView()
}
