//
//  NewExpense.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.03.25.
//

import SwiftUI
import SwiftData

struct NewExpense: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var amount: Double = 0
    @State private var date: Date = .now
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle")
                        .font(.title3)
                        .tint(.black)
                }
                
                Text("Add new expense")
                    .font(.headline)
                Spacer()
                Button("Save", action: save)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,15)
            .padding(.top,15)
            
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    CustomTextField("Title", "Coin Name", value: $title)
                    CustomTextField("Description", "Type something here...", value: $subtitle)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Price $")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("0.00", value: $amount, formatter: numberFormatter)
                            .padding(.horizontal, 15)
                            .padding(.vertical,12)
                            .foregroundStyle(.gray)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.15))
                            }
                            .frame(maxWidth: 150)
                            .keyboardType(.decimalPad)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Date")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DatePicker("", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                        
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray.opacity(0.15))
                            }
                        
                    }
                }
                .padding(15)
            }
        }
//        .navigationTitle("Add new expense")
//        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                Button("Save") {
//                    save()
//                }
//            }
//        }
    }
    
    func save() {
        
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
