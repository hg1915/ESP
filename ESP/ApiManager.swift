//
//  ApiManager.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import Foundation
import Foundation

protocol NetworkingProtocol {
    func getRecords(completion: @escaping (Result<Record, RecordError>) -> Void)
}

class ApiManager: NetworkingProtocol {
    
    private let urlBuilder: URLBuilding
    private let xmlParser: XMLParsing
    
    init(
        urlBuilder: URLBuilding,
        xmlParser: XMLParsing
    ) {
        self.urlBuilder = urlBuilder
        self.xmlParser = xmlParser
    }
    
    func getRecords(completion: @escaping (Result<Record, RecordError>) -> Void) {
        
        guard let urlString = urlBuilder.recordsURL(),
                let url = URL(string: urlString)
        else {
            completion(.failure(.invalidURL))
            return
        }
        
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let data = data else {
                    completion(.failure(.dataUnavailable))
                    return
                }
                self?.xmlParser.parseRecordsXML(from: data, completion: completion)
            }
            .resume()
        }
    }
}
