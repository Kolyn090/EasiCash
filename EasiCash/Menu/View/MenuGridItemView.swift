//
//  MenuGridItemView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI
import DeveloperToolsSupport

struct MenuGridItemView: View {
    
    @Environment(MenuViewModel.self) var menuViewModel: MenuViewModel
    
    var item: MenuItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 24, weight: .medium))
                Text("Price: $\(String(format: "%.2f", item.price))")
                    .font(.system(size: 18, weight: .regular))
            }
        }
        .padding(.horizontal, 10)
//        .overlay(alignment: .topTrailing) {
//            if item.quantity > 0 {
//                Circle()
//                    .fill(Color.white)
//                    .frame(width: 25)
//                    .padding(.horizontal, 15)
//                    .padding(.vertical, 8)
//                    .overlay {
//                        Text("\(item.quantity)")
//                    }
//            }
//        }
        .onTapGesture {
            withAnimation {
                menuViewModel.addOrder(with: item)
            }
        }
    }
    
}

#Preview {
    MenuGridItemView(item: MenuItem.examples[0])
        .environment(MenuViewModel.mock)
}
