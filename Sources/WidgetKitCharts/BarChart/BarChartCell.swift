//
//  SwiftUIView.swift
//  
//
//  Created by 冯旭超 on 2021/7/8.
//

import SwiftUI

public struct BarChartCell: View {
    var value: Double
    var cellWidth: CGFloat
    
    public init(value: Double, cellWidth: CGFloat) {
        self.value = value
        self.cellWidth = cellWidth
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.red]), startPoint: .bottom, endPoint: .top))
        }
        .frame(width: cellWidth)
        .scaleEffect(CGSize(width: 1, height: self.value), anchor: .bottom)
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        BarChartCell(value: 0.5, cellWidth: 10)
    }
}
