//
//  MenuGridItemView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI

struct MenuGridItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.chickenWings)
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text("Chicken")
                    .font(.system(size: 24, weight: .medium))
                Text("Price: $10")
                    .font(.system(size: 18, weight: .regular))
            }
        }
        .padding(.horizontal, 5)
    }
    
}

#Preview {
    MenuGridItemView()
}
