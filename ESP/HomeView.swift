//
//  HomeView.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//
import SwiftUI
import WidgetKit

struct HomeView: View {
    @StateObject var viewModel: ViewModel
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Image("icon")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        ZStack {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)
            
            WidgetView(
                viewModel: .init(
                    widgetSize: .medium
                ),
                record: viewModel.record
            )
            .padding()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .background {
                WidgetCenter.shared.reloadAllTimelines()
            }
            if newPhase == .active {
                viewModel.fetchRecords()
            }
        }
    }
}
