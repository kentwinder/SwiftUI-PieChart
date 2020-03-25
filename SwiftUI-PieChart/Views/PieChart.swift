//
//  PieChart.swift
//  SwiftUI-PieChart
//
//  Created by Kent Winder on 3/17/20.
//  Copyright © 2020 Nextzy. All rights reserved.
//

import SwiftUI
import Combine

struct PieChart: View {
    var pieChartData: PieChartData
    
    var body: some View {
        GeometryReader { geometry in
            self.makePieChart(geometry, slides: self.pieChartData.data)
        }
    }
    
    func makePieChart(_ geometry: GeometryProxy, slides: [SlideData]) -> some View {
        let chartSize = min(geometry.size.width, geometry.size.height)
        let radius = chartSize / 2
        let centerX = geometry.size.width / 2
        let centerY = geometry.size.height / 2
        
        return ZStack {
            ForEach(0..<slides.count, id: \.self) { index in
                PieChartSlide(geometry: geometry, slideData: slides[index], index: index)
            }
            ForEach(slides) { slideData in
                Text("\(slideData.annotation)%")
                    .foregroundColor(Color.white)
                    .position(CGPoint(x: centerX + slideData.annotationDeltaX*radius,
                                      y: centerY + slideData.annotationDeltaY*radius))
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(pieChartData: PieChartData(data: [1, 2, 3]))
    }
}
