//
//  CheckoutListView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import SwiftUI

struct CheckoutListView: View {
    @State private var items: [MenuItem] = [
        MenuItem(imageName: "chickenWings", title: "Item 1", price: 9.99, quantity: 1),
        MenuItem(imageName: "chickenWings", title: "Item 1", price: 9.99, quantity: 1),
        MenuItem(imageName: "chickenWings", title: "Item 1", price: 9.99, quantity: 1)
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
