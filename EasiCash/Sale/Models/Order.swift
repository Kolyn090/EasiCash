//
//  Order.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import Foundation

enum OrderType: String, CaseIterable {
    case online = "online"
    case inStore = "inStore"
}

struct Order: Identifiable {
    let id: UUID
    let price: Double
    let items: [Item]
    let createdAt: Date
    let type: OrderType
}
