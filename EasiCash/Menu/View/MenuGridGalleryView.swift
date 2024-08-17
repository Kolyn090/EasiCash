//
//  MenuGridGalleryView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI

struct MenuGridGalleryView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var selectedCategory: MenuCategory = .food
    
    var body: some View {
        ScrollView {
            FilterFoodCategoryChipsView(selectedCategory: $selectedCategory)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(MenuItem.examples) { item in
                    MenuGridItemView(item: item)
                }
            }
        }
    }
}

#Preview {
    MenuGridGalleryView()
        .environment(MenuViewModel.mock)
}
