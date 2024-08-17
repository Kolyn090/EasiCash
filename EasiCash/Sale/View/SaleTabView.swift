//
//  SaleTabView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI
import Foundation

struct SaleTabView: View {
    @State private var orders: [Order] = [
        Order(id: UUID(), user: "Hugo", price: 49.99, items: [MenuItem(imageName: "burger", title: "Item1", price: 49.99, quantity: 2)], createdAt: Date(), type: .online),
        Order(id: UUID(), user: "Alice", price: 79.99, items: [MenuItem(imageName: "pho", title: "Item2", price: 79.99, quantity: 2)], createdAt: Date(), type: .inStore)
    ]
    
    @State private var isInspectorPresented: Bool = false
    
    @State private var selectedOrderID: Order.ID? = nil
    
    private var selectedOrder: Order? {
        guard let selectedOrderID else { return nil }
        
        return orders.filter { $0.id == selectedOrderID }[0]
    }
    
    var body: some View {
        NavigationStack {
            Table(orders, selection: $selectedOrderID) {
                TableColumn("Order ID") { order in
                    Text(order.id.uuidString.prefix(16))
                }
                
                TableColumn("Price") { order in
                    Text(String(format: "$%.2f", order.price))
                }
                
                TableColumn("Order Type") { order in
                    Text(order.type.rawValue.capitalized)
                }
                
                TableColumn("Time of transaction") { order in
                    Text(order.createdAt, formatter: dateFormatter)
                }
            }
            .onChange(of: selectedOrderID) {
                if selectedOrderID != nil {
                    isInspectorPresented = true
                }
            }
            .navigationTitle("Sales")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: presentItemInspector) {
                        Image(systemName: "info.bubble.fill")
                    }
                    .disabled(selectedOrderID == nil)
                }
            }
            .inspector(isPresented: $isInspectorPresented) {
                // TODO: View to show items
                if let selectedOrder {
                    SaleInspectionView(order: selectedOrder)
                    
                }
            }
            
        }
    }
    
    func presentItemInspector() {
        isInspectorPresented.toggle()
    }
    
    // Date Formatter for displaying date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}


#Preview {
    SaleTabView()
}
