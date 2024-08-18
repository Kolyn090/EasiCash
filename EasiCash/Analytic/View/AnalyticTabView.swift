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
                        
                        VStack {
                            
                            Text(String(format: "$%.2f", viewModel.getTodayRevenue()))
                                .font(.system(size: 80))
                                .foregroundStyle(Color.red)
                            
                            Text("Today Total Revenue")
                                .font(.system(size: 25, weight: .bold))
                            
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
                        
                        Chart(viewModel.getSalesByCategory()) { item in
                            SectorMark(
                                angle: .value("Amount", item.amount),
                                innerRadius: .ratio(0.6),
                                angularInset: 1.5
                            )
                            .foregroundStyle(by: .value("Category", item.category))
                        }
                        .chartBackground { chartProxy in
                            GeometryReader { geometry in
                                let frame = geometry[chartProxy.plotFrame!]
                                VStack {
                                    Text("Distribution of")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    Text("Items by Category")
                                        .font(.caption.bold())
                                        .foregroundColor(.primary)
                                }
                                .position(x: frame.midX, y: frame.midY)
                            }
                        }
                        .frame(width: 300, height: 300)

                    }
                    
                    
                }
                GridRow {
                    Text("R2, C1")
                    Text("R2, C2")
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
