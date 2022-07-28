//
//  WidgetView.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import SwiftUI

struct WidgetView: View {
    
    @StateObject var viewModel: WidgetViewModel
    @ObservedObject var record: Record
    @Environment(\.colorScheme) var colorScheme
    
    private var isDarkMode: Bool {
        colorScheme == .dark
    }
    
    var body: some View {
        if (record.soldToday != "some" && record.kwMonth.decimalPointAdjustment() != "some text") {
            content
        } else {
            skeletonView
        }
    }
    
    private var content: some View {
        VStack(spacing: 6) {
            salesView
            monthView
            switch viewModel.widgetSize {
            case .small:
                smallStatisticsView
            case .medium:
                mediumStatisticsView
            }
            contactView
            kwView
        }
        .padding(.all)
        .background(isDarkMode ? Color.black : Color.white)
        .cornerRadius(12)
    }
    
    private var skeletonView: some View {
        content
            .redacted(reason: .placeholder)
    }
    
    private var salesView: some View {
        HStack {
            Text("SALES")
                .font(viewModel.widgetSize.salesFont)
            Spacer()
            Text(Date(), style: .time)
                .foregroundColor(Color("grayPrimary"))
                .font(viewModel.widgetSize.generalFont)
        }
    }
    
    private var monthView: some View {
        HStack {
            Text(viewModel.currentDate)
            Spacer()
            Text(viewModel.currentMonth)
        }
        .foregroundColor(Color("grayPrimary"))
        .font(viewModel.widgetSize.generalFont)
    }
    
    private var mediumStatisticsView: some View {
        HStack(alignment: .bottom) {
            Text(record.soldToday)
                .foregroundColor(Color("mintColor"))
                .font(viewModel.widgetSize.statisticsMainFont)
            Text("\(record.soldVsYesterday.limited(to: 3))%")
                .foregroundColor(viewModel.soldVsYesterdayColor(record.soldVsYesterday))
                .font(viewModel.widgetSize.statisticsSecondaryFont)
                .padding(.bottom, 8)
            Spacer()
            Text(record.soldMonth)
                .foregroundColor(Color("grayPrimary"))
                .font(viewModel.widgetSize.statisticsSecondaryFont)
                .padding(.bottom, 8)
            Text(record.activeMonth)
                .foregroundColor(Color("bluePrimary"))
                .font(viewModel.widgetSize.statisticsMainFont)
        }
    }
    
    private var smallStatisticsView: some View {
        VStack {
            HStack {
                Text(record.soldToday)
                    .foregroundColor(Color("mintColor"))
                Spacer()
                Text(record.activeMonth)
                    .foregroundColor(Color("bluePrimary"))
            }
            .font(viewModel.widgetSize.statisticsMainFont)
            
            HStack {
                Text("\(record.soldVsYesterday.limited(to: 3))%")
                    .foregroundColor(Color("redPrimary"))
                Spacer()
                Text(record.soldMonth)
                    .foregroundColor(Color("grayPrimary"))
            }
            .font(viewModel.widgetSize.statisticsSecondaryFont)
        }
    }
    
    private var contactView: some View {
        HStack {
            Text("$\(record.contractToday.applyCommas())")
            Spacer()
            Text("$\(record.contractMonth.applyCommas())")
        }
        .font(viewModel.widgetSize.generalFont)
    }
    
    private var kwView: some View {
        HStack {
            Text("\(record.kwToday.decimalPointAdjustment().applyCommas())KW")
            Spacer()
            Text("\(record.kwMonth.decimalPointAdjustment().applyCommas())KW")
        }
        .font(viewModel.widgetSize.generalFont)
    }
}
