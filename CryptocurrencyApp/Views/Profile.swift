//
//  Profile.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 16.04.25.
//

import SwiftUI

struct Profile: View {
    
    @State private var activeTheme: String = "Default"
    @Namespace var animation
    
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
                    
                    
                    CustomNavigationLink(title: "Profile settings") {
                        Text("")
                            .navigationTitle("Profile settings")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("background").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Notifications") {
                        Text("")
                            .navigationTitle("Notifications")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("background").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Purchase History") {
                        Text("")
                            .navigationTitle("Purchase History")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("background").ignoresSafeArea())
                    }
                    
                    CustomNavigationLink(title: "Help Center") {
                        Text("")
                            .navigationTitle("Help Center")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("background").ignoresSafeArea())
                    }
                    
                    
                    VStack(spacing: 15) {
                        Image(systemName: activeTheme == "Dark" ? "moon.fill" : "cloud.sun.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.gray.opacity(0.4), .yellow)
                        
                        Text("Customize your interface. Choose between dark mode and light mode")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                        
                        
                        ThemePicker()
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    }
                    .padding(.vertical,25)
                    .padding(.horizontal)
                    
                    
                }
                .padding(.horizontal,20)
                .padding(.vertical,20)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom,50)
        }
    }
    
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping () -> Detail) -> some View {
        
        NavigationLink {
            content()
        } label: {
            HStack {
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding(16)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.15))
            }
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
    
    @ViewBuilder
    func ThemePicker() -> some View {
        HStack(spacing: 10) {
            ForEach(Theme.allCases, id: \.rawValue) { theme in
                Text(theme.rawValue)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(activeTheme == theme.rawValue ? .white : .gray)
                    .padding(.vertical,7)
                    .frame(width: 100)
                    .background {
                        if activeTheme == theme.rawValue {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "THEME", in: animation)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    }
                }
                    .onTapGesture {
                        withAnimation {
                            activeTheme = theme.rawValue
                        }
                    }
            }
        }
        .padding(.top,15)
        .padding(.bottom,5)
    }
    
    enum Theme: String, CaseIterable {
        case defaultTheme = "Default"
        case light = "Light"
        case dark = "Dark"
    }
}

#Preview {
    Profile()
}
