//
//  CheckoutListView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//

import SwiftUI

struct CheckoutListView: View {
    @State private var items: [MenuItem] = MenuItem.examples
    
    var body: some View {
        List {
            ForEach($items) { item in
                CheckoutListItemView(item: item)
            }
            .listRowBackground(Color.clear)
        }
    }
}

#Preview {
    CheckoutListView()
}
