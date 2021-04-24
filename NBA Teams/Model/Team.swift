//
//  Team.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

struct TeamsList: Codable {

    var list: [Team]

    var metadata: Metadata

    enum Keys: String, CodingKey {
        case list = "data"
        case metadata = "meta"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        self.list = try! values.decode([FailableDecodable<Team>].self, forKey: .list).compactMap { $0.base }
        self.metadata = try values.decode(Metadata.self, forKey: .metadata)
    }
}

struct Team: Codable, ThreeLabel {

    var id: Int
    var abbreviation: String
    var city: String
    var conference: String
    var division: String
    var fullName: String
    var name: String

    enum Keys: String, CodingKey {
        case id
        case abbreviation
        case city
        case conference
        case division
        case fullName = "full_name"
        case name
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.abbreviation = try values.decode(String.self, forKey: .abbreviation)
        self.city = try values.decode(String.self, forKey: .city)
        self.conference = try values.decode(String.self, forKey: .conference)
        self.division = try values.decode(String.self, forKey: .division)
        self.fullName = try values.decode(String.self, forKey: .fullName)
        self.name = try values.decode(String.self, forKey: .name)
    }

    var upperTitle: String {
        return self.city
    }

    var centerTitle: String {
        return self.fullName
    }

    var lowerTitle: String {
        return self.division  + " - " + self.conference
    }
}
