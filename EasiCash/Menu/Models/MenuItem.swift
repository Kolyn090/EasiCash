//
//  MenuItem.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    var title: String
    var price: Double
    var quantity: Int
}
