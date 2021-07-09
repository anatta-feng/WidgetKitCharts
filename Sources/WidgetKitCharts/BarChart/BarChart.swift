//
//  SwiftUIView.swift
//  
//
//  Created by 冯旭超 on 2021/7/9.
//

import SwiftUI

public struct BarChart: View {
    var data: [Double]
    
    var maxValue: Double {
        guard let max = data.max() else {
            return 1
        }
        return max != 0 ? max : 1
    }
    
    public init(data:[Double]) {
        self.data = data
    }
    
    var cellWidth: Double {
        return 10
    }
    var cellSpacing: Double {
        return 10
    }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: getCellSpacing(chartWidth: geometry.frame(in:.local).width)) {
                ForEach(0..<self.data.count, id: \.self) { i in
                    BarChartCell(value: self.normalizedValue(index: i), cellWidth: getCellWidth(chartWidth: geometry.frame(in: .local).width))
                }
            }
            
        }
    }
    
    func normalizedValue(index: Int) -> Double {
        return Double(self.data[index]) / Double(self.maxValue)
    }
    
    func getCellSpacing(chartWidth: CGFloat) -> CGFloat {
        return chartWidth / CGFloat(self.data.count * 3)
    }
    
    func getCellWidth(chartWidth: CGFloat) -> CGFloat {
        return (chartWidth - getCellSpacing(chartWidth: chartWidth) * CGFloat((self.data.count - 1))) / CGFloat(self.data.count)
    }
    
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: [0.12,0.34,0.21,0.54,0.12,])
    }
}
