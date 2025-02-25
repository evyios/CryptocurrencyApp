//
//  MainView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 22.02.25.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: Tab = .home
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                Home(animation: animation)
                    .tag(Tab.home)
                
                Text("Note")
                    .tag(Tab.pen)
                
                Text("Settings")
                    .tag(Tab.settings)
                
                Text("Profile")
                    .tag(Tab.profile)
            }
            TabBar()
        }
    }
    
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Image(tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(currentTab == tab ? .white : .gray.opacity(0.5))
                    .offset(y: currentTab == tab ? -30 : 0)
                    .background(content: {
                        if currentTab == tab {
                            Circle()
                                .fill(.black)
                                .scaleEffect(2.5)
                                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 5, y: 10)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                                .offset(y: currentTab == tab ? -30 : 0)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        currentTab = tab
                    }
                
            }
        }
        .padding(.horizontal, 15)
        .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.75, blendDuration: 0.75), value: currentTab)
        .background {
            CustomCorner(corners: [.topLeft, .topRight], radius: 25)
                .fill(Color.gray.opacity(0.2))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
