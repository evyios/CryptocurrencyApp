//
//  ExpenseDisplay.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 24.03.25.
//

import SwiftUI

struct ExpenseDisplay: View {
    
    var expense: Expense
    
    var body: some View {
        HStack(spacing: 12) {
            Image("expense")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.title)
                    .foregroundStyle(.primary)
                
                Text(expense.subTitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text(dateFormat(date: expense.date, format: "dd MMM yyyy"))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(expense.amount.currencyFormat())
                .fontWeight(.semibold)
        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.2))
        }
        .padding()
    }
}

#Preview {
    ExpenseDisplay(expense: sampleExpense[0])
}
