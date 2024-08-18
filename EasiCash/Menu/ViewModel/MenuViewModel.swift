//
//  MenuViewModel.swift
//  EasiCash
//
//  Created by Yongye on 8/17/24.
//

import Foundation

@Observable class MenuViewModel {
    
    var menuItems: [MenuItem] = [
        // food
        .init(imageName: "chickenWings", title: "chicken wings", category: .food, price: 10.99),
        .init(imageName: "pho", title: "pho", category: .food, price: 11.99),
        .init(imageName: "burger", title: "burger", category: .food, price: 12.99),
        
        // drink
        .init(imageName: "thaiTea", title: "thai Tea", category: .drink, price: 3.99),
        .init(imageName: "bobaTea", title: "boba Tea", category: .drink, price: 4.99),
        .init(imageName: "coffee", title: "coffee", category: .drink, price: 2.99),
        .init(imageName: "tea", title: "tea", category: .drink, price: 1.49),
        .init(imageName: "yogurt", title: "yogurt", category: .drink, price: 2.49),
        .init(imageName: "bananaShake", title: "banana Shake", category: .drink, price: 3.19)
    ]
    
    var customerSelectedItems: CheckOutList
    
    var totalPrice: Double {
        return customerSelectedItems.items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }

    init(customerSelectedItems: CheckOutList = .init(items: [])) {
        self.customerSelectedItems = customerSelectedItems
    }
    
    func addOrder(with item: MenuItem) {
        
        let indexWhereItemExists = customerSelectedItems.items.firstIndex { $0.id == item.id }
        
        if let index = indexWhereItemExists {
            self.customerSelectedItems.items[index].quantity += 1
        } else {
            self.customerSelectedItems.items.append(item)
        }
    }
    
    func removeOrder(with item: MenuItem) {
        
        let indexWhereItemExists = customerSelectedItems.items.firstIndex { $0.id == item.id }
        
        if let index = indexWhereItemExists {
            let quantity = self.customerSelectedItems.items[index].quantity
            if quantity > 1 {
                self.customerSelectedItems.items[index].quantity -= 1
            } else if quantity == 1 {
                self.customerSelectedItems.items.remove(at: index)
            }
        }
    }
    
    func clearOrder() {
        self.customerSelectedItems = .init(items: [])
    }
    
    static var mock: MenuViewModel {
        .init(customerSelectedItems: .init(items: [
            .init(imageName: "chickenWings", title: "chickenWings", category: .food, price: 10.99, quantity: 1)
        ]))
    }
}
