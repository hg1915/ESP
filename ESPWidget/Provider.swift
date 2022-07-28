//
//  Provider.swift
//  ESPWidgetExtension
//
//  Created by GGTECH LLC on 7/27/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    private let apiManager: NetworkingProtocol = ApiManager(urlBuilder: URLBuilder(), xmlParser: XMLParser())
    func placeholder(in context: Context) -> RecordEntry {
        if let userDefaults = UserDefaults(suiteName: "group.com.HG.ESP.group"),
           let data = userDefaults.value(forKey: "record") as? Data,
           let decodedRecord = try? JSONDecoder().decode(Record.self, from: data) {
            return RecordEntry(date: Date(), record: decodedRecord)
        } else {
            return RecordEntry(date: Date(), record: Record())
        }
    }

    func getSnapshot(in context: Context, completion: @escaping (RecordEntry) -> ()) {
        if let userDefaults = UserDefaults(suiteName: "group.com.HG.ESP.group"),
           let data = userDefaults.value(forKey: "record") as? Data,
           let decodedRecord = try? JSONDecoder().decode(Record.self, from: data) {
            completion(RecordEntry(date: Date(), record: decodedRecord))
        } else {
            completion(RecordEntry(date: Date(), record: Record()))
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RecordEntry>) -> ()) {
        var entries: [RecordEntry] = []
        apiManager.getRecords { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let record):
                    entries.removeAll()
                    entries = [
                        RecordEntry(date: Date(), record: record),
                        RecordEntry(date: Calendar.current.date(byAdding: .minute, value: 2, to: Date())!, record: record)
                    ]
                    
                    let timeline = Timeline(entries: entries, policy: .atEnd)
                    completion(timeline)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
