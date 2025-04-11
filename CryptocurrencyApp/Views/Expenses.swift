//
//  Expenses.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 23.03.25.
//

import SwiftUI
import SwiftData

struct Expenses: View {
    
    @Query(sort: [SortDescriptor(\Expense.date, order: .reverse)], animation: .snappy) private var expenses: [Expense]
    
    @State private var addExpense: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: -15) {
                ForEach(expenses) {
                    ExpenseDisplay(expense: $0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Recent purchases")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        addExpense.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.darkGreen)
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView {
                        Label("No purchases so far", systemImage: "wallet.bifold")
                    }
                }
            }
            .sheet(isPresented: $addExpense) {
                NewExpense()
            }
        }
    }
}

#Preview {
    Expenses()
}
