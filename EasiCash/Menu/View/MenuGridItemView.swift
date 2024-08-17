//
//  MenuGridItemView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI
import DeveloperToolsSupport

struct MenuGridItemView: View {
    
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
    }
    
}

#Preview {
    MenuGridItemView(item: MenuItem.examples[0])
}
