//
//  MenuViewModel.swift
//  EasiCash
//
//  Created by Yongye on 8/17/24.
//

import Foundation

@Observable class MenuViewModel {
    
    var customerSelectedItems: CheckOutList
    
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
    
    func clearOrder() {
        self.customerSelectedItems = .init(items: [])
    }
    
    static var mock: MenuViewModel {
        .init(customerSelectedItems: .init(items: [
            .init(imageName: "chickenWings", title: "chickenWings", price: 10.99, quantity: 1)
        ]))
    }
}
