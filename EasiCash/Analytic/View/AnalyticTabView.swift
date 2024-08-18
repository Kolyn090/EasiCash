//
//  AnalyticTabView.swift
//  EasiCash
//
//  Created by Yongye on 8/16/24.
//

import Charts
import SwiftUI

struct AnalyticTabView: View {
    
    @Environment(SaleViewModel.self) var viewModel: SaleViewModel
    
    var body: some View {
        NavigationStack {
            
            Grid (horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 300, height: 300)
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
                    
                    if viewModel.getOverallSale().isEmpty {
                        Text("Please add some sales")
                    } else {
                        
                        Chart(viewModel.getOverallSale()) { item in
                            BarMark(
                                x: .value("Amount", item.amount),
                                y: .value("Title", item.title)
                            )
                            
                            .annotation(position: .overlay) {
                                Text("\(item.amount)")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            .foregroundStyle(item.amount > 50 ? .green : .red)

                        }
                        .chartXAxisLabel("Amount")
                        .chartYAxisLabel("Title")
                        .frame(width: 300, height: 300)
                        .padding()
                        
                    }
                    
                    
                }
                GridRow {
                    PieChartView()
                        .padding()
                        .frame(width: 600, height: 300)

                }
            }
            
            .navigationTitle("Analytic")
        }
    }
}

#Preview {
    AnalyticTabView()
        .environment(SaleViewModel.mock)
}
