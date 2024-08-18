//
//  MenuGridGalleryView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI
import PhotosUI

struct MenuGridGalleryView: View {
    
    @Environment(MenuViewModel.self) var viewModel: MenuViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var selectedCategory: MenuCategory = .food
    
    @State private var presentAddMenuItemSheetView: Bool = false
        
    private var filteredMenuItems: [MenuItem] {
        viewModel.menuItems.filter { $0.category == selectedCategory }
    }
    
    var body: some View {
        ScrollView {
            FilterFoodCategoryChipsView(selectedCategory: $selectedCategory)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(filteredMenuItems) { item in
                    MenuGridItemView(item: item)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    presentAddMenuItemSheetView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $presentAddMenuItemSheetView) {
            AddNewMenuItemSheetView(presentAddMenuItemSheetView: $presentAddMenuItemSheetView)
        }
    }
}

#Preview {
    NavigationStack {
        MenuGridGalleryView()
            .environment(MenuViewModel.mock)
    }
}
