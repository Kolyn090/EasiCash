//
//  SaleViewModel.swift
//  EasiCash
//
//  Created by Yongye on 8/17/24.
//

import Foundation

@Observable class SaleViewModel {
    
    var saleHistory: [Order]
    
    init(saleHistory: [Order] = []) {
        self.saleHistory = saleHistory
    }
    
    func getOverallSale() -> [BarchartSaleByAmount] {
        var foodCount: [String: Int] = [:]

        for order in saleHistory {
            for item in order.items {
                foodCount[item.title, default: 0] += item.quantity
            }
        }
        
        return foodCount.map { (foodName, count) in
            BarchartSaleByAmount(title: foodName, amount: count)
        }
        .sorted { $0.amount > $1.amount}
    }
    
    func addSale(with checkoutList: CheckOutList, name: String, note: String, type: OrderType, totalPrice: Double) {
        self.saleHistory.append(.init(user: name, note: note, price: totalPrice, items: checkoutList.items, type: type))
    }
    
    static var mock: SaleViewModel {
        .init(saleHistory: [
            .init(id: UUID(), user: "Hugo", note: "Thank you", price: 49.99, items: [MenuItem(imageName: "burger", title: "Burger", category: .food, price: 49.99, quantity: 20)], createdAt: Date(), type: .online),
            Order(id: UUID(), user: "Chengtao", note: "Love the food", price: 79.99, items: [MenuItem(imageName: "pho", title: "Pho", category: .drink, price: 79.99, quantity: 100)], createdAt: Date(), type: .inStore)
        ])
    }
}
