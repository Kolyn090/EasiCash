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
    
    func addSale(with checkoutList: CheckOutList, name: String, note: String, type: OrderType, totalPrice: Double) {
        self.saleHistory.append(.init(user: name, note: note, price: totalPrice, items: checkoutList.items, type: type))
    }
    
    static var mock: SaleViewModel {
        .init(saleHistory: [
            .init(id: UUID(), user: "Hugo", note: "Thank you", price: 49.99, items: [MenuItem(imageName: "burger", title: "Item1", category: .food, price: 49.99, quantity: 2)], createdAt: Date(), type: .online),
            Order(id: UUID(), user: "Chengtao", note: "Love the food", price: 79.99, items: [MenuItem(imageName: "pho", title: "Item2", category: .drink, price: 79.99, quantity: 2)], createdAt: Date(), type: .inStore)
        ])
    }
}
