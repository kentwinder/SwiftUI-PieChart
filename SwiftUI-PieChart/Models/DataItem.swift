//
//  DataItem.swift
//  SwiftUI-PieChart
//
//  Created by Kent Winder on 3/17/20.
//  Copyright © 2020 Nextzy. All rights reserved.
//

import Foundation
import SwiftUI

class DataItem {
    var name: String! = ""
    var value: Double = 0.0
    var color: Color! = .blue
    var highlighted: Bool = false
    
    init(name: String, value: Double, color: Color? = nil) {
        self.name = name
        self.value = value
        if let color = color {
            self.color = color
        } else {
            self.color = .random()
        }
    }
}
