//
//  PieChartView.swift
//  EasiCash
//
//  Created by CHENGTAO on 8/17/24.
//


import SwiftUI
import Charts

struct PieChartView: View {
    var menuItems: [MenuItem] = MenuItem.examples
    
    var groupedByCategory: [(category: MenuCategory, count: Int)] {
        Dictionary(grouping: menuItems, by: \.category)
            .map { (key, value) in
                (category: key, count: value.count)
            }
    }
    
    var body: some View {
        VStack {
            Chart {
                ForEach(groupedByCategory, id: \.category) { data in
                    SectorMark(
                        angle: .value("Count", data.count),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", data.category.rawValue.capitalized))
//                    .annotation(position: .overlay) {
//                        Text("\(data.category.rawValue.capitalized): \(data.count)")
//                            .fontWeight(.semibold)
//                            .fontDesign(.rounded)
//                            .foregroundColor(.white)
//                    }
                }
            }
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    let frame = geometry[chartProxy.plotFrame!]
                    VStack {
                        Text("Distribution of")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("Items by Category")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
                }
            .chartLegend(position: .bottomLeading)
        }
    }
}

//#Preview {
//    PieChartView()
//}
