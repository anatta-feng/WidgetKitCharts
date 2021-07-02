//
//  SwiftUIView.swift
//
//
//  Created by 冯旭超 on 2021/6/30.
//

import SwiftUI

public struct Line: View {
    var data: [Double]
    var minDataValue: Double?
    var maxDataValue: Double?
    var frame: CGRect
    
    public init(data: [Double], minDataValue: Double? = nil, maxDataValue: Double? = nil, frame: CGRect) {
        self.data = data;
        self.minDataValue = minDataValue;
        self.maxDataValue = maxDataValue;
        self.frame = frame;
    }
    
    let padding:CGFloat = 30
    
    var stepWidth: CGFloat {
        if data.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.count-1)
    }
    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = self.data
        if minDataValue != nil && maxDataValue != nil {
            min = minDataValue!
            max = maxDataValue!
        }else if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        }else {
            return 0
        }
        if let min = min, let max = max, min != max {
            if (min <= 0){
                return (self.frame.size.height-padding) / CGFloat(max - min)
            }else{
                return (self.frame.size.height-padding) / CGFloat(max - min)
            }
        }
        return 0
    }
    
    public var body: some View {
        return ZStack {
            self.closedPath
                .fill(LinearGradient(gradient: Gradient(colors: [ Color.red.opacity(0.5), .white]), startPoint: .bottom, endPoint: .top))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0))
            self.path
                .stroke(Color.red, style: StrokeStyle(lineWidth: 2,  lineJoin: .round))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
        }
    }
    
    var path: Path {
        return Path.quadCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth, y: stepHeight));
    }
    
    var closedPath: Path {
        return Path.quadClosedCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth, y: stepHeight))
    }
}

struct Line_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { geometry in
            Line(data: [10, 20, 47, 12, 59, 12, 54], minDataValue: nil, maxDataValue: nil, frame: geometry.frame(in: .local) )
        }
        .frame(width: 120, height: 160)
        
    }
}
