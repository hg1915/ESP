//
//  String+.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import Foundation
extension String {
    // Converts string to double and limits number of digits after comma
    func limited(to: Int) -> String {
        if let doubleValue = Double(self) {
            let nsNumber = NSNumber(value: doubleValue)
            let numberFormatter = NumberFormatter()
            numberFormatter.maximumSignificantDigits = to
            numberFormatter.maximumFractionDigits = 3
            return numberFormatter.string(from: nsNumber) ?? self
        }
        return self
    }
    
    func applyCommas() -> String {
        if let doubleValue = Double(self) {
            let nsNumber = NSNumber(value: doubleValue)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter.string(from: nsNumber) ?? self
        }
        return self
    }
    
    func decimalPointAdjustment() -> String {
        if let doubleValue = Double(self) {
            let nsNumber = NSNumber(value: doubleValue)
            let numberFormatter = NumberFormatter()
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 1
            return numberFormatter.string(from: nsNumber) ?? self
        }
        return self
    }
    
}
