//
//  GenericObj.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

struct FailableDecodable<Base: Decodable>: Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self.base = try container.decode(Base.self)
        } catch {
            self.base = nil
            print("JSON decoding:\(error)")
        }
    }
}

struct Metadata: Codable {

    var totalPages: Int
    var currentPage: Int
    var nextPage: Int?
    var elementForPage: Int
    var totalCount: Int

    enum Keys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case elementForPage = "per_page"
        case totalCount = "total_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        self.totalPages = try values.decode(Int.self, forKey: .totalPages)
        self.currentPage = try values.decode(Int.self, forKey: .currentPage)
        self.nextPage = try? values.decode(Int.self, forKey: .nextPage)
        self.elementForPage = try values.decode(Int.self, forKey: .elementForPage)
        self.totalCount = try values.decode(Int.self, forKey: .totalCount)
    }
}
