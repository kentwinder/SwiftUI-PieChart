//
//  ContentView.swift
//  SwiftUI-PieChart
//
//  Created by Kent Winder on 3/17/20.
//  Copyright © 2020 Nextzy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                PieChart(pieChartData: self.viewModel.pieChartData)
                    .frame(width: geometry.size.width * 0.8,
                           height: geometry.size.width * 0.8)
                    .padding(.top, 20)
                Spacer()
            }.onAppear {
                self.viewModel.randomData()
            }
            .navigationBarTitle("Pie Chart", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.randomData()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
