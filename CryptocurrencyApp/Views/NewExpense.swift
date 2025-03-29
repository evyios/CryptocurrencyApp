//
//  NewExpense.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.03.25.
//

import SwiftUI

struct NewExpense: View {
    
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var amount: Double = 0
    @State private var date: Date = .now
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                CustomTextField("Title", "Coin Name", value: $title)
                CustomTextField("Description", "Type something here...", value: $subtitle)
                
            
            }
            .padding(15)
        }
        .navigationTitle("Add new expense")
    }
    
    @ViewBuilder
    func CustomTextField(_ title: String, _ hint: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if title == "Description" {
                TextField(hint, text: value)
                    .padding(.horizontal, 15)
                    .padding(.vertical,12)
                    .frame(height: 80, alignment: .topLeading)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.15))
                    }
                    
            } else {
                TextField(hint, text: value)
                    .padding(.horizontal, 15)
                    .padding(.vertical,12)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.15))
                    }
            }
        }
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    NavigationStack {
        NewExpense()
    }
}
