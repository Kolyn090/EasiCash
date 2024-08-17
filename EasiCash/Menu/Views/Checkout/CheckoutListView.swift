//
//  CheckoutListView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import SwiftUI

struct CheckoutListView: View {
    @State private var items: [MenuItem] = [
        MenuItem(title: "Item 1", price: 9.99, quantity: 1),
        MenuItem(title: "Item 2", price: 19.99, quantity: 2),
        MenuItem(title: "Item 3", price: 29.99, quantity: 3)
    ]
    
    var body: some View {
        List {
            ForEach($items) { item in
                CheckoutListItemView(item: item)
            }
        }
    }
}

#Preview {
    CheckoutListView()
}
