//
//  URLBuilder.swift
//  ESP
//
//  Created by GGTECH LLC on 7/27/22.
//

import Foundation

protocol URLBuilding {
    func recordsURL() -> String?
}

struct URLBuilder: URLBuilding {
    //"https://joinesp.quickbase.com/db/br8quzhyc?a=API_DoQuery&clist=36&query=%7b%2711%27.EX.%27today%27%7d&usertoken=b6xwrf_gbx2_0_ddbqj6gcfaqkuddg2ccstqtr246"

    //new url 
    //https://joinesp.quickbase.com/db/bqd4qrcpi?a=API_DoQuery&query=%7B%278%27.EX.%27today%27%7D&clist=167&usertoken=b6nziq_gbx2_0_bmdewcdcckv8tkhkhwhhtt4db2
    
    func recordsURL() -> String? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "joinesp.quickbase.com"
        components.path = "/db/bqd4qrcpi"
        
        components.queryItems = [
            URLQueryItem(name: "a", value: "API_DoQuery"),
            URLQueryItem(name: "clist", value: "167"),
            URLQueryItem(name: "query", value: "%7B%278%27.EX.%27today%27%7D".removingPercentEncoding),
            URLQueryItem(name: "usertoken", value: "b6nziq_gbx2_0_bmdewcdcckv8tkhkhwhhtt4db2")
        ]
        
        return components.string
    }
}
