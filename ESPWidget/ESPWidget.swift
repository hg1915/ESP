//
//  ESPWidget.swift
//  ESPWidget
//
//  Created by GGTECH LLC on 7/27/22.
//

import WidgetKit
import SwiftUI


struct SimpleEntry: TimelineEntry {
    let date: Date
}



@main
struct ESPWidget: Widget {
    let kind: String = "ESPWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ESPWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("ESPWidget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}


