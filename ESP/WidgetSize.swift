//
//  WidgetSize.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import SwiftUI

extension WidgetViewModel {
    enum WidgetSize {
        case small
        case medium
        
        var salesFont: Font {
            switch self {
            case .small:
                return .system(size: 17, weight: .semibold)
            case .medium:
                return .system(size: 14, weight: .semibold)
            }
        }
        
        var generalFont: Font {
            switch self {
            case .small:
                return .system(size: 9, weight: .semibold)
            case .medium:
                return .system(size: 12, weight: .semibold)
            }
        }
        
        var statisticsMainFont: Font {
            switch self {
            case .small:
                return .system(size: 34, weight: .semibold)
            case .medium:
                return .system(size: 44, weight: .semibold)
            }
        }
        
        var statisticsSecondaryFont: Font {
            switch self {
            case .small:
                return .system(size: 12, weight: .semibold)
            case .medium:
                return .system(size: 16, weight: .semibold)
            }
        }
    }
}
