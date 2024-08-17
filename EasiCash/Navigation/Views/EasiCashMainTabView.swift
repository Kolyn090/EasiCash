//
//  EasiCashMainTabView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import SwiftUI

struct EasiCashMainTabView: View {
    
    @AppStorage("QuackTabViewCustomization") var tabViewCustomization: TabViewCustomization
    
    @State private var selectedTab: AppTabs = .menu
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(AppTabs.menu.name, systemImage: AppTabs.menu.icon, value: .menu) {
                Text("menu")
                
            }
            .customizationID(AppTabs.menu.customizationID)
            
            Tab(AppTabs.sale.name, systemImage: AppTabs.sale.icon, value: .menu) {
                Text("sale")
                
            }
            .customizationID(AppTabs.sale.customizationID)
            
            Tab(AppTabs.analytic.name, systemImage: AppTabs.analytic.icon, value: .analytic) {
                Text("analytic")
            }
            .customizationID(AppTabs.analytic.customizationID)
            
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($tabViewCustomization)
        .tint(.red)
    }
}

#Preview {
    EasiCashMainTabView()
}
