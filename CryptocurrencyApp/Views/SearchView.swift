//
//  SearchView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 25.07.25.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var vm: HomeVM
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.title3)
            
            Divider()
            
            TextField("Search something", text: $vm.searchText)
                .overlay {
                    Image(systemName: "xmark.circle.fill")
                        .padding(7)
                        .offset(x: 4)
                        .foregroundStyle(Color.main)
                        .opacity(vm.searchText.isEmpty ? 0 : 1)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            vm.searchText = ""
                        }
                }
        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        .frame(height: 45)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.2))
        }
        .padding(.bottom, 5)
    }
}

#Preview {
    SearchView()
        .environmentObject(CoinPreview.instance.homeVM)
}
