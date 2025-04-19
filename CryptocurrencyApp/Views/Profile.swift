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
                    
                    VStack(spacing: 15) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            
                    }
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
