//
//  Record.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import SwiftUI
import WidgetKit

class Record: Codable, ObservableObject {
    var soldToday: String
    var soldVsYesterday: String
    var kwToday: String
    var contractToday: String
    var activeMonth: String
    var soldMonth: String
    var contractMonth: String
    var kwMonth: String
    
    enum CodingKeys: String, CodingKey {
        case soldToday = "SoldToday"
        case soldVsYesterday = "SoldVsYesterday"
        case kwToday = "KWToday"
        case contractToday = "ContractToday"
        case activeMonth = "ActiveMonth"
        case soldMonth = "SoldMonth"
        case contractMonth = "ContractMonth"
        case kwMonth = "KWMonth"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(soldToday, forKey: .soldToday)
        try container.encode(soldVsYesterday, forKey: .soldVsYesterday)
        try container.encode(kwToday, forKey: .kwToday)
        try container.encode(contractToday, forKey: .contractToday)
        try container.encode(activeMonth, forKey: .activeMonth)
        try container.encode(soldMonth, forKey: .soldMonth)
        try container.encode(contractMonth, forKey: .contractMonth)
        try container.encode(kwMonth, forKey: .kwMonth)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.soldToday = try container.decode(String.self, forKey: .soldToday)
        self.soldVsYesterday = try container.decode(String.self, forKey: .soldVsYesterday)
        self.kwToday = try container.decode(String.self, forKey: .kwToday)
        self.contractToday = try container.decode(String.self, forKey: .contractToday)
        self.activeMonth = try container.decode(String.self, forKey: .activeMonth)
        self.soldMonth = try container.decode(String.self, forKey: .soldMonth)
        self.contractMonth = try container.decode(String.self, forKey: .contractMonth)
        self.kwMonth = try container.decode(String.self, forKey: .kwMonth)
    }
    
    init() {
        /// do not remove or change them
        self.soldToday = "some"
        self.soldVsYesterday = "some text"
        self.kwToday = "some text"
        self.contractToday = "some text"
        self.soldMonth = "some text"
        self.activeMonth = "some"
        self.contractMonth = "some text"
        self.kwMonth = "some text"
    }
}
