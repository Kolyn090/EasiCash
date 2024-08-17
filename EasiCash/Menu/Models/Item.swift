//
//  Item.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var title: String
    var price: Double
    var quantity: Int
}
