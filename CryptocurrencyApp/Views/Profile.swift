//
//  Profile.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 16.04.25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Profile")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal,20)
                .padding(.vertical,20)
            }
            .toolbar(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    Profile()
}
