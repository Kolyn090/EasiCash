//
//  MenuViewModel.swift
//  EasiCash
//
//  Created by Yongye on 8/17/24.
//

import Foundation

@Observable class MenuViewModel {
    
    var customerSelectedItems: CheckOutList?
    
    init(customerSelectedItems: CheckOutList? = nil) {
        self.customerSelectedItems = customerSelectedItems
    }
    
    func addOrder(with item: MenuItem) {
        if customerSelectedItems != nil {
            self.customerSelectedItems?.items.append(item)
        } else {
            self.customerSelectedItems = .init(items: [item])
        }
    }
    
    static var mock: MenuViewModel {
        .init(customerSelectedItems: .init(items: [
            .init(imageName: "chickenWings", title: "chickenWings", price: 10.99, quantity: 1)
        ]))
    }
}
