//
//  ESPApp.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import SwiftUI

@main
struct ESPApp: App {
    
    
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: ViewModel.init(
                    apiManager: ApiManager(
                        urlBuilder: URLBuilder(),
                        xmlParser: XMLParser()
                    )
                )
            )
        }
    }
    
    
    
    
}
