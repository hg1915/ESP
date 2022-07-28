//
//  WidgetEntryView.swift
//  ESPWidgetExtension
//
//  Created by GGTECH LLC on 7/27/22.
//

import SwiftUI
import WidgetKit

struct ESPWidgetEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    @Environment(\.colorScheme) var colorScheme
    
    var entry: Provider.Entry
    private var backgroundColor: Color {
        colorScheme == .dark ? Color.black : Color.white
    }

    var body: some View {
        switch family {
        case .systemSmall:
            WidgetView(
                viewModel: .init(
                    widgetSize: .small
                ),
                record: entry.record
            )
            .background(backgroundColor)
        case .systemMedium:
            WidgetView(
                viewModel: .init(
                    widgetSize: .medium
                ),
                record: entry.record
            )
            .background(backgroundColor)
        default: ZStack { }
        }
    }
}
