//
//  CheckoutListItemView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//
import SwiftUI

struct CheckoutListItemView: View {
    
    @Binding var item: MenuItem
    
    private var quantityFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.leading, 16)
                Spacer()
                
                Text(String(format: "$%.2f", item.price))
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.trailing, 16)
            }
            
            HStack {
                Text("Quantity:")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.leading, 16)
                Spacer()
                
                HStack {
                    Button {
                        if item.quantity > 0 {
                            item.quantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                    }
                    .tint(.blue)
                    
                    TextField("Quantity", value: $item.quantity, formatter: quantityFormatter)
                        .frame(width: 50)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                    
                    Button {
                        item.quantity += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                    .tint(.blue)
                }
            }
        }
    }
}

#Preview {
    
    @Previewable @State var item: MenuItem = MenuItem.examples[0]
    
    CheckoutListItemView(item: $item)
}
