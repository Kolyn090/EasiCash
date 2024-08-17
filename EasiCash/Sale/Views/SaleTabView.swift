//
//  SaleTabView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI

struct SaleTabView: View {
    @State private var orders: [Order] = [
        Order(id: UUID(), price: 49.99, items: [Item(title: "Item 1", price: 19.99, quantity: 1)], createdAt: Date(), type: .online),
        Order(id: UUID(), price: 79.99, items: [Item(title: "Item 2", price: 79.99, quantity: 1)], createdAt: Date(), type: .inStore)
    ]
    
    var body: some View {
        VStack {
            Table(orders) {
                TableColumn("Order ID") { order in
                    Text(order.id.uuidString.prefix(16))
                }
                
                TableColumn("Price") { order in
                    Text(String(format: "$%.2f", order.price))
                }
                
                TableColumn("Order Type") { order in
                    Text(order.type.rawValue.capitalized)
                }
                
                TableColumn("Created At") { order in
                    Text(order.createdAt, formatter: dateFormatter)
                }
            }
            .frame(minWidth: 600, minHeight: 400) // Adjust frame as needed
        }
    }
    
    // Date Formatter for displaying date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}

struct SaleTabView_Previews: PreviewProvider {
    static var previews: some View {
        SaleTabView()
    }
}
