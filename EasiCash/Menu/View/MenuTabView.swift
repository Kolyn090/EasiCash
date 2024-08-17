//
//  MenuTabView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI

struct MenuTabView: View {
    
    @State private var isInspectorPresented: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                MenuGridGalleryView()
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: presentInspector) {
                        Image(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90")
                    }
                }
            }
            .inspector(isPresented: $isInspectorPresented) {
                CheckoutListView()
            }
            
        }
    }
    
    func presentInspector() {
        isInspectorPresented.toggle()
    }
}

#Preview {
    MenuTabView()
        .environment(MenuViewModel())
}
