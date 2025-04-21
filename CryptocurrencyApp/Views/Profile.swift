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
                    
                    VStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .offset(y: -30)
                            .padding(.bottom,-30)
                        
                        Text("Evgeny Yachny")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack(spacing: 11) {
                            Image(systemName: "house")
                                .foregroundStyle(.main)
                                .offset(x: -2)
                            
                            Text("Address: Belarus, Minsk")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 15) {
                            Image(systemName: "phone.circle")
                                .foregroundStyle(.main)
                        
                            Text("Phone: + 375 (29) 187-41-52")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal,.bottom])
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.15))
                    }
                    .padding()
                    .padding(.top,10)
                    
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
