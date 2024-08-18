//
//  AnalyticTabView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import Charts
import SwiftUI

import SwiftUI

struct AnalyticTabView: View {
    
    @Environment(SaleViewModel.self) var viewModel: SaleViewModel
    
    var body: some View {
        NavigationStack {
            Grid(horizontalSpacing: -10, verticalSpacing: 20) {
                
                GridRow {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 350, height: 350)
                            .gradientForeground(colors: [Color.green, Color.yellow])
                        
                        VStack {
                            Text(String(format: "$%.2f", viewModel.getTodayRevenue()))
                                .font(.system(size: 70))
                                .foregroundStyle(Color.black.opacity(0.8))
                            
                            Text("Today Total Revenue")
                                .font(.system(size: 25, weight: .bold))
                                .gradientForeground(colors: [Color.green, Color.yellow])
                        }
                    }
                    
                    if !viewModel.getOverallSale().isEmpty {
                        BarChartView(viewModel: viewModel)
                        PieChartView(viewModel: viewModel)
                    }
                }
                    HourlyIncomeChartView(viewModel: viewModel)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .navigationTitle("Analytic")
            .padding(20)
        }
        .padding(20)
    }
}


#Preview {
    AnalyticTabView()
        .environment(SaleViewModel.mock)
}
