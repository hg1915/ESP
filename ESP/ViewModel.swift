//
//  ViewModel.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import Foundation
import Foundation

final class ViewModel: ObservableObject {
    let apiManager: NetworkingProtocol
    @Published var record: Record
    
    init(apiManager: NetworkingProtocol) {
        self.apiManager = apiManager
        self.record = Record()
    }
    
    func fetchRecords() {
        apiManager.getRecords { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let record):
                    self?.record = record
                    if let data = self?.encode(record) {
                        let userDefaults = UserDefaults(suiteName: "group.com.HG.ESP.group")
                        userDefaults?.set(data, forKey: "record")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func encode(_ record: Record) -> Data? {
        try? JSONEncoder().encode(record)
    }
}
