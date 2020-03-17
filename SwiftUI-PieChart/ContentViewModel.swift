//
//  ContentViewModel.swift
//  SwiftUI-PieChart
//
//  Created by Kent Winder on 3/17/20.
//  Copyright © 2020 Nextzy. All rights reserved.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
    @Published var pieChartData = PieChartData(data: [Double]())
    
    func randomData() {
        let number = Int.random(in: 3...7)
        var values: [Double] = []
        for _ in 0..<number {
            values.append(Double.random(in: 10...50))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.pieChartData = PieChartData(data: values)
        }
    }
}
