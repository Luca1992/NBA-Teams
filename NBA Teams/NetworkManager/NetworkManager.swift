//
//  NetworkManager.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error?)
}

enum Method: String {
    case get = "GET"
}

class NetworkManager {

    static let baseUrl: String = "https://free-nba.p.rapidapi.com"

    static let sessionManager = URLSession.shared
}

struct Request {

    let headers = [
        "x-rapidapi-key": "1bfe763e8amsh1f08d2818a76461p1023d7jsnd9a70ad57884",
        "x-rapidapi-host": "free-nba.p.rapidapi.com"
    ]

    var request: URLRequest?

    init(url: String, method: Method) {
        guard let url = URL(string: NetworkManager.baseUrl + url) else { return }
        request = URLRequest(url: url,
                             cachePolicy: .useProtocolCachePolicy,
                             timeoutInterval: 10.0)
        request?.httpMethod = method.rawValue
        request?.allHTTPHeaderFields = headers
    }
}

extension Data {
    func jsonString() -> String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
}
