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
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Recent purchases")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { }) {
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
        }
    }
}

#Preview {
    Expenses()
}
