//
//  MenuItem.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import Foundation
import DeveloperToolsSupport

struct MenuItem: Identifiable, Hashable, Equatable {
    
    var id: UUID
    var imageName: String
    var title: String
    var price: Double
    var quantity: Int
    
    init(id: UUID = UUID(), imageName: String, title: String, price: Double, quantity: Int = 1) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.price = price
        self.quantity = quantity
    }
    
    static var examples: [Self] = [
        .init(imageName: "chickenWings", title: "chicken wings", price: 10.99),
        .init(imageName: "pho", title: "pho", price: 11.99),
        .init(imageName: "burger", title: "burger", price: 12.99)
    ]
}
