//
//  MenuGridItemView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI

struct MenuGridItemView: View {
    
    @Environment(MenuViewModel.self) var menuViewModel: MenuViewModel
        
    var item: MenuItem
    
    private var quantity: Int {
        let filteredItems = menuViewModel.customerSelectedItems.items.filter { item.id == $0.id }
        if filteredItems.isEmpty { return 0 }
        return filteredItems[0].quantity
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                if let image = item.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .frame(width: 150, height: 150, alignment: .center)
            .contentShape(Rectangle())
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(alignment: .topTrailing) {
                if quantity > 0 {
                    Circle()
                        .fill(Color.black.opacity(0.8))
                        .frame(width: 25)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .overlay {
                            Text("\(quantity)")
                                .foregroundStyle(Color.white)
                        }
                }
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .lineLimit(1)
                    .frame(width: 150, alignment: .leading)
                    .font(.system(size: 24, weight: .medium))
                    .truncationMode(.tail)
                    .minimumScaleFactor(0.7)
                Text("Price: $\(String(format: "%.2f", item.price))")
                    .frame(width: 150, alignment: .leading)
                    .font(.system(size: 18, weight: .regular))
                    .minimumScaleFactor(0.7)
            }
        }
        .padding(.horizontal, 10)
        .onTapGesture {
            withAnimation {
                menuViewModel.addOrder(with: item)
            }
        }
        .onTapGesture(count: 2) {
            withAnimation {
                menuViewModel.removeOrder(with: item)
            }
        }
        .shadow(radius: 5) 
    }
    
}

#Preview {
    MenuGridItemView(item: MenuViewModel().menuItems[0])
        .environment(MenuViewModel.mock)
}
