//
//  MenuItem.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import Foundation
import DeveloperToolsSupport

enum MenuCategory: String, CaseIterable {
    case food
    case drink
    case dessert
}

struct MenuItem: Identifiable, Hashable, Equatable {
    
    var id: UUID
    var imageName: String
    var title: String
    var price: Double
    var quantity: Int
    var category: MenuCategory
    
    init(id: UUID = UUID(), imageName: String, title: String, category: MenuCategory, price: Double, quantity: Int = 1) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.price = price
        self.quantity = quantity
        self.category = category
    }
    
    static var examples: [Self] = [
        // food
        .init(imageName: "chickenWings", title: "chicken wings", category: .food, price: 10.99),
        .init(imageName: "pho", title: "pho", category: .food, price: 11.99),
        .init(imageName: "burger", title: "burger", category: .food, price: 12.99),
        
        // drink
        .init(imageName: "thaiTea", title: "thai Tea", category: .drink, price: 3.99)
    ]
}
