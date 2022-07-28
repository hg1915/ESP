//
//  WidgetViewModel.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//
import Foundation
import SwiftUI

final class WidgetViewModel: ObservableObject {
    
    private(set) var widgetSize: WidgetViewModel.WidgetSize

    init(
        widgetSize: WidgetViewModel.WidgetSize
    ) {
        self.widgetSize = widgetSize
    }
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        return dateFormatter.string(from: Date())
    }
    
    var currentMonth: String {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        return monthFormatter.string(from: Date())
    }
    
    func soldVsYesterdayColor( _ value: String) -> Color {
        if value == "0" {
            return Color.orange
        }
        if value.first == "+" {
            return Color.green
        }
        if value.first == "-" {
            return Color("redPrimary")
        }
        return Color.green
    }
}
