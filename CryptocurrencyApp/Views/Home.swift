//
//  Home.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI

struct Home: View {
    
    @State private var activeTag: String = "All"
    var animation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 15) {
            HomeHeader()
            
            Tags()
            
            Spacer(minLength: 0)
        }
        .padding(12)
        // Поскольку Tab Bar находится в ZStack
        .padding(.bottom, 50)
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
                                    .fill(Color.black)
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
    
    var tags: [String] = ["All", "DeFi", "RWA", "Gaming", "DePin", "AI", "Meme"]
}
    
#Preview {
    ContentView()
}
