//
//  XMLParser.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import Foundation
import SWXMLHash

protocol XMLParsing {
    func parseRecordsXML(from data: Data, completion: @escaping (Result<Record, RecordError>) -> Void)
}

final class XMLParser: XMLParsing {
    
    func parseRecordsXML(from data: Data, completion: @escaping (Result<Record, RecordError>) -> Void) {
        guard let stringData = String(data: data, encoding: .utf8) else {
            completion(.failure(.dataUnavailable))
            return
        }
        
        let xml = XMLHash.parse(stringData)
        
        guard let payload = xml["qdbapi"]["record"]["payload"].element?.text.replacingOccurrences(of: " ", with: ""),
              let payloadData = payload.data(using: .utf8)
        else {
            completion(.failure(.xmlParseFailure))
            return
        }
        
        if let record = decodeRecord(from: payloadData) {
            completion(.success(record))
        } else {
            completion(.failure(.decodeFailure))
        }
    }
    
    private func decodeRecord(from payloadData: Data) -> Record? {
        do {
            let record = try JSONDecoder().decode(Record.self, from: payloadData)
            return record
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
